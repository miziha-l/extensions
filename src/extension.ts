import { ExtensionContext, Position, Uri, window, workspace, Range } from "vscode";
import { LanguageClientOptions } from "vscode-languageclient";
import { LanguageClient } from 'vscode-languageclient/browser'; 
import { Utils } from "vscode-uri";

const genPosByShift = (pos: Position, shift = 0) => pos.with(pos.line, pos.character + shift);

export function activate (context: ExtensionContext) {
  // 初始化client
  console.log('dev-thrift-web-support activated!');
  const serverMain = Uri.joinPath(context.extensionUri, 'dist/thrift-language-server.js');
  const worker = new Worker(serverMain.toString(true));

  const clientOptions: LanguageClientOptions = {
    documentSelector: [{ language: 'thrift' }],
  };
  const client = new LanguageClient('thrift-web-support', 'LSP thrift-web-support', clientOptions, worker);

  client.onRequest('customRequest/getWordByPosition', (position: Position) => {
    const editor = window.activeTextEditor;
    const document = editor?.document;
    if (!document || !position) {
      return {
        word: '',
        prevWord: '',
      };
    }

    const wordRange = document.getWordRangeAtPosition(new Position(position.line, position.character));
    const lineContent = document.lineAt(new Position(position.line, position.character));
    // 处理引入逻辑;
    const includeReg = /^\s*include\s+["']([^"']+)["']\s*;?$/;
    const execResult = includeReg.exec(lineContent.text);
    if (execResult?.length && execResult.length > 0 && execResult[1]) {
      return {
        word: execResult[1],
        prevWord: '',
      };
    }
    const word = document.getText(wordRange);

    let prevWord = '';
    if (wordRange) {
      const leftCharacter = document.getText(new Range(genPosByShift(wordRange.start, -1), wordRange.start));
      if (leftCharacter && leftCharacter === '.') {
        const prevWordRange = document.getWordRangeAtPosition(genPosByShift(wordRange.start, -2));
        prevWord = document.getText(prevWordRange);
      }
    }
    return {
      word,
      prevWord,
    };
  });

  client.onRequest('customRequest/getSelectionRange', async () => {
    const editor = window.activeTextEditor;
    if (editor) {
      const selection = editor.selection;
      const selectedText = editor.document.getText(selection);
      const range = new Range(
        selection.start.line,
        selection.start.character,
        selection.end.line,
        selection.end.character,
      );

      return {
        text: selectedText,
        range,
      };
    }
    return {
      text: '',
      range: [],
    };
  });

  client.onRequest('customRequest/getContentByPath', async (path: string) => {
    const fileUri = Uri.parse(path);
    return await workspace.fs.readFile(fileUri);
  });

  client.onRequest('customRequest/getAllFileUri', async (filePath?: string) => {
    const files = await workspace.findFiles('**/*.thrift');
    return files;
  });

  // 监听来自服务器的格式化失败通知
  client.onNotification('custom/formatError', (params) => {
    window.showErrorMessage('请选中完整的结构进行 format');
  });

  client.start();
}
