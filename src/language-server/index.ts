import { createConnection, BrowserMessageReader, BrowserMessageWriter } from 'vscode-languageserver/browser';
import { TextDocuments } from 'vscode-languageserver/node';
import { TextDocument } from 'vscode-languageserver-textdocument';
import { parse, SyntaxType, TextLocation } from './thrift-parse';
import { ASTHelper, IncludeNode, ThriftKeywords } from './utils';
import {
  Range,
  Location,
  Position,
  CompletionItem,
  CompletionItemKind,
  TextEdit,
  InsertTextFormat,
} from 'vscode-languageserver';
import { ThriftData } from 'thrift-parser-ts';
import { ThriftFormatter, newOption } from 'thrift-fmt-ts';
import { snippets } from './thrift';
import { Uri } from 'vscode';
import pLimit from 'p-limit';

const worker = self as unknown as Worker;
const messageReader = new BrowserMessageReader(worker);
const messageWriter = new BrowserMessageWriter(worker);
const connection = createConnection(messageReader, messageWriter);
const documents = new TextDocuments(TextDocument);
let rootUri = '';
let rootParams = '';

export enum CustomeSyntaxKind {
  StructDefinition = CompletionItemKind.Struct,
  EnumDefinition = CompletionItemKind.Enum,
  ConstDefinition = CompletionItemKind.Constant,
  ExceptionDefinition = CompletionItemKind.Property,
  IncludeDefinition = CompletionItemKind.Module,
}

export const genZeroBasedNum = (num: number) => num - 1;

// const genPosByShift = (pos: Position, shift = 0) => pos.with(pos.line, pos.character + shift);

const genRange = (loc: TextLocation) => {
  const { start, end } = loc;
  const startPosition = Position.create(genZeroBasedNum(start.line), genZeroBasedNum(start.column));
  const endPosition = Position.create(genZeroBasedNum(end.line), genZeroBasedNum(end.column));
  return Range.create(startPosition, endPosition);
};

function genLocation(loc: TextLocation, filePath: string) {
  return Location.create(filePath, genRange(loc));
}

const getDocmentContent = async (filePath: string) => {
  const buffer: Uint8Array = await connection.sendRequest('customRequest/getContentByPath', filePath);
  const content = new TextDecoder().decode(buffer);
  const regex = /\/\/.*?(?=\n|$)/g;
  const cleanedCode = content.replace(regex, '');
  return cleanedCode;
};

// 代码跳转
connection.onDefinition(async (params) => {
  const { position, textDocument } = params;
  const document = documents.get(textDocument.uri);
  let word = '';
  let preWord = '';
  try {
    const result: Record<string, string> = await connection.sendRequest('customRequest/getWordByPosition', position);
    word = result.word;
    preWord = result.prevWord;
  } catch {
    return null;
  }
  if (ThriftKeywords.includes(word) || !word || !document) {
    return null;
  }
  const file = document.getText();
  const regex = /\/\/.*?(?=\n|$)/g;
  const cleanedCode = file.replace(regex, '');
  const process = async (fileContent: string, filePath: string, document: TextDocument): Promise<any> => {
    try {
      const ast = parse(fileContent);
      // 如果解析type 不是thrift 则返回null
      if (ast.type !== SyntaxType.ThriftDocument) {
        return Promise.resolve(null);
      }
      const helper = new ASTHelper(ast, document, filePath, documents);
      const wordNode = helper.findNodeByWord(word);
      const prevWordNode = helper.findNodeByWord(preWord);
      const pathItem = helper.includeNodes.find((item) => item.fileName === word);
      // enum 类型
      if (prevWordNode && prevWordNode.type === 'EnumDefinition') {
        const enumNumber = prevWordNode.members.find((item) => item.name.value === word);
        if (enumNumber) {
          return genLocation(enumNumber.name.loc, filePath);
        }
      }

      // 引用文件类型
      if (pathItem) {
        return genLocation(pathItem.loc, pathItem.filePath);
      }

      // 单词节点
      if (wordNode) {
        return genLocation(wordNode.name.loc, filePath);
      }

      // 找不到就去引入文件中查找
      for (let i = 0; i < helper.includeNodes.length; i++) {
        const item = helper.includeNodes[i];
        const content = await getDocmentContent(item.filePath);
        if (`${content}`.includes(word)) {
          const uriObj: any = await connection.sendRequest('customRequest/getAllFileUri', item.filePath);
          if (document) {
            return process(content, item.filePath + '?' + encodeURIComponent(uriObj.query), document);
          } else {
            return Promise.resolve(null);
          }
        }
      }
      return Promise.resolve(null);
    } catch (err) {
      return Promise.resolve(null);
    }
  };

  return process(cleanedCode, textDocument.uri, document);
});

// 代码提示
connection.onCompletion(async (params) => {
  const { position, textDocument } = params;
  const document = documents.get(textDocument.uri);
  const fileRootPath = textDocument.uri.split('?')[0];
  const completionItems: any = [];
  Object.keys(snippets).forEach((key) => {
    const snippet = snippets[key];
    const completionItem = {
      label: snippet.prefix,
      kind: CompletionItemKind.Snippet,
      insertText: snippet.body.join('\n'),
      insertTextFormat: InsertTextFormat.Snippet,
      documentation: snippet.description,
    };
    completionItems.push(completionItem);
  });

  return completionItems;
  // try {
  //   const { word, preWord }: Record<string, string> = await connection.sendRequest('customRequest/getWordByPosition');
  //   if (!word || !document) {
  //     return [];
  //   }
  //   const ast = parse(document.getText());
  //   const completionItems: CompletionItem[] = [];
  //   if (ast.type === SyntaxType.ThriftDocument) {
  //     const helper = new ASTHelper(ast, document, fileRootPath, documents);
  //     const wordNodes = helper.findNodesByInput(word);
  //     wordNodes.forEach((item: any) => {
  //       const i: any = CompletionItem.create(item.name.value);
  //       i.kind = CustomeSyntaxKind[item.type];
  //       i.detail;
  //       completionItems.push(i);
  //     });
  //   }

  //   completionItems.map((cur) => cur.label || '');
  //   const results = await Promise.all([completionItems]);
  //   const suggestions = Array.prototype.concat.apply([], results);
  //   return suggestions;
  // } catch {
  //   return [];
  // }
});

connection.onReferences(async (params) => {
  const { position, textDocument } = params;
  const fileRootPath = textDocument.uri.split('?')[0];
  const allUri: Uri[] = await connection.sendRequest('customRequest/getAllFileUri', '');
  let word = '';
  let preWord = '';
  try {
    const result: Record<string, string> = await connection.sendRequest('customRequest/getWordByPosition', position);
    word = result.word;
    preWord = result.preWord;
  } catch {
    return [];
  }
  if (ThriftKeywords.includes(word)) {
    return [];
  }
  const document = documents.get(textDocument.uri);
  const filename = /(?<=\/)([^/]+)(?=\.thrift$)/.exec(fileRootPath);
  if (!word || !document) {
    return [];
  }
  const limit = pLimit(20);
  // 并行查找
  try {
    const resultList: any = await Promise.all(
      allUri.map((uri) =>
        limit(() =>
          getDocmentContent(rootUri + uri.path).then((file) => {
            const ast = parse(file);
            const filePath = rootUri + uri.path;
            if (ast.type === SyntaxType.ThriftDocument) {
              const helper = new ASTHelper(ast, document, filePath, documents);
              const references = helper.findReferences(ast, word, filename?.[0] || '');
              const isInlcudesCurFile = helper.includeNodes.find((cur) => cur.filePath === fileRootPath);
              if ((isInlcudesCurFile || filePath === fileRootPath) && references.length) {
                // 引用的Node位置
                return {
                  references,
                  uriPath: filePath,
                };
              } else {
                return [];
              }
            }
          }),
        ),
      ),
    );
    const referenceList: any = [];
    resultList.forEach((cur: any) => {
      if (cur?.references?.length) {
        const fileItem = allUri.find((uri) => cur.uriPath.includes(uri.path));
        cur.references.forEach((item: any) => {
          referenceList.push({
            uri: fileItem
              ? cur.uriPath + '?' + encodeURIComponent(fileItem.query) + '#' + encodeURIComponent(fileItem.fragment)
              : cur.uriPath,
            loc: item.loc,
          });
        });
      }
    });
    return Promise.resolve(
      referenceList.map((cur: any) => {
        return Location.create(cur.uri, genRange(cur.loc));
      }),
    );
  } catch (err) {
    return Promise.resolve(null);
  }
});

connection.onDocumentRangeFormatting(async (params) => {
  const document = documents.get(params.textDocument.uri);
  if (!document) {
    return [];
  }
  const selectedText = document.getText(params.range);
  if (document && selectedText) {
    return formatDocument(document, selectedText, params.range);
  }
});

connection.onDocumentFormatting(async (params) => {
  // 可更改格式化快捷键   以及在client主动发起格式化请求 editor.document.format();
  // [
  //   {
  //     "key": "ctrl+shift+i",
  //     "command": "editor.action.formatDocument",
  //     "when": "editorTextFocus"
  //   }
  // ]
  const document = documents.get(params.textDocument.uri);
  if (document) {
    return formatDocument(document);
  }
});

function formatDocument(document: TextDocument, text?: string, range?: Range): TextEdit[] {
  const textEdits: TextEdit[] = [];
  const fullText = text || document.getText();
  const fullRange = Range.create(document.positionAt(0), document.positionAt(fullText.length));
  const thrift = ThriftData.fromString(fullText);
  const fmt = new ThriftFormatter(thrift);
  fmt.option(newOption({ keepComment: true, alignByAssign: true }));
  const formattedText = fmt.format();
  textEdits.push(TextEdit.replace(range || fullRange, formattedText));
  return textEdits;
}

function formatSelection(text: string, range: Range): TextEdit[] {
  const textEdits: TextEdit[] = [];
  const fullText = text;
  const fullRange = range;
  const thrift = ThriftData.fromString(fullText);
  const fmt = new ThriftFormatter(thrift);
  fmt.option(newOption({ keepComment: true, alignByAssign: true }));
  const formattedText = fmt.format();
  textEdits.push(TextEdit.replace(fullRange, formattedText));
  return textEdits;
}

// 监听文档事件
documents.listen(connection);

connection.onInitialize((params) => {
  const workspaceFolders = params.workspaceFolders; // 获取工作区根路径
  if (workspaceFolders) {
    rootUri = workspaceFolders[0].uri.split('?')[0];
    if (workspaceFolders[0].uri.includes('?')) {
      rootParams = workspaceFolders[0].uri.split('?')[1];
    }
    if (rootUri.includes('/files')) {
      rootUri = rootUri.split('/files')[0];
    }
  }
  // 返回初始化结果
  return {
    capabilities: {
      completionProvider: {
        completionItem: {
          labelDetailsSupport: true,
        },
      },
      referencesProvider: true,
      documentFormattingProvider: true,
      documentRangeFormattingProvider: true,
      textDocumentSync: 1, // 表示支持文本文档同步
      definitionProvider: true,
    },
  };
});

connection.listen();
