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

  client.onRequest('customRequest/getSelectedText', () => {
    const editor = window.activeTextEditor;
    const document = editor?.document;
    const selection = editor?.selection;
    console.log(123, selection);

    return {
      text: document?.getText(selection),
      position: {
        start: selection?.start,
        end: selection?.end
      },
    }
  })

  client.onRequest('customRequest/getWordByPosition', () => {
    const editor = window.activeTextEditor;
    const document = editor?.document;
    const position = editor?.selection.active;
    const wordRange = document.getWordRangeAtPosition(position);  
      
    const lineContent = document.lineAt(position);
    // 处理引入逻辑;
    const includeReg = /^\s*include\s+["']([^"']+)["']\s*;?$/;    
    const execResult = includeReg.exec(lineContent.text);  
      
    if (execResult?.length > 0 && execResult[1]) {
      return {
        word: execResult[1],
        prevWord: ''
      }
    } 
    const word = document.getText(wordRange);

    let prevWord = '';
    const leftCharacter = document.getText(
      new Range(
        genPosByShift(wordRange.start, -1),
        wordRange.start)
    );
    if (leftCharacter && leftCharacter === '.') {
      const prevWordRange = document.getWordRangeAtPosition(
        genPosByShift(wordRange.start, -2)
      );
      prevWord = document.getText(prevWordRange);
    }
    return {
      word,
      prevWord,
    }
  });

  client.onRequest('customRequest/getContentByPath', async (path: string) => {    
    const fileUri = Uri.parse(path);
    return await workspace.fs.readFile(fileUri)
  });

  client.onRequest('customRequest/getAllFileUri', async () => {
    const files = await workspace.findFiles('**/*.thrift');
    return files
  })

  client.start();
}

