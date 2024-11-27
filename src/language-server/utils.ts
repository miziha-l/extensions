import { TextDocument } from 'vscode-languageserver-textdocument';

import { ThriftDocument, ThriftStatement, SyntaxType, TextLocation, IncludeDefinition } from './thrift-parse';
import { TextDocuments } from 'vscode-languageserver';

export const ThriftKeywords = [
  'bool',
  'byte',
  'i8',
  'i16',
  'i32',
  'i64',
  'double',
  'string',
  'binary',
  'list',
  'set',
  'map',
  'namespace',
  'include',
  'cpp_include',
  'struct',
  'union',
  'exception',
  'service',
  'extends',
  'typedef',
  'const',
  'required',
  'optional',
  'oneway',
  'void',
  'throws',
  'xsd_namespace',
  'xsd_all',
  'required',
  'optional',
  'true',
  'false',
  'enum',
];

export interface IncludeNode extends IncludeDefinition {
  filePath: string;
  fileName: string;
  raw?: string;
}

export type filterFnType = (item: ThriftStatement, index: number) => any;

export type GetReturnType<original> = original extends (...x: any[]) => infer returnType ? returnType : never;

export const wordNodeFilter = (word: string) => (item: ThriftStatement, index: number) => {
  if (
    item.type !== SyntaxType.IncludeDefinition &&
    item.type !== SyntaxType.CppIncludeDefinition &&
    item.name.value === word
  ) {
    return item;
  }
};

export const includeNodeFilter = () => (item: ThriftStatement, index: number) => {
  if (item.type === SyntaxType.IncludeDefinition) {
    return item;
  }
};

export const genZeroBasedNum = (num: number) => num - 1;

export function resolvePath(basePath: string, relativePath: string) {
  const baseParts = basePath.split('/').slice(0, -1); // 获取 basePath 的目录部分
  const relativeParts = relativePath.split('/');

  for (const part of relativeParts) {
    if (part === '..') {
      baseParts.pop();
    } else if (part !== '.') {
      baseParts.push(part);
    }
  }

  return baseParts.join('/');
}

export class ASTHelper {
  ast: ThriftDocument;
  document: TextDocument;
  filePath: string;
  documents: TextDocuments<TextDocument>;
  readonly includeNodes: IncludeNode[];
  constructor(ast: ThriftDocument, document: TextDocument, filePath: string, documents: TextDocuments<TextDocument>) {
    this.ast = ast;
    this.document = document;
    this.documents = documents;
    this.filePath = filePath;
    this.includeNodes = this.getIncludeNodes();
  }

  getIncludeNodes() {
    const includeNodes = this.filter(includeNodeFilter()) as IncludeDefinition[];
    return includeNodes.map((item) => {
      const { path: includePath } = item;
      const fileName = includePath.value;
      const newPath = resolvePath(this.filePath, fileName);
      return {
        ...item,
        fileName,
        filePath: newPath,
      };
    });
  }

  filter = <fn extends filterFnType>(originalFn: fn) => {
    const result = this.ast.body.filter(originalFn) as GetReturnType<fn>[];
    return result;
  };

  findReferences = (ast: any, targetTypeName: string, fileName: string) => {
    const references: any = [];
    for (let i = 0; i < ast.body.length; i++) {
      const p1Node = ast.body[i];
      if (p1Node.fields) {
        p1Node.fields.forEach((cur: any) => {
          if (cur.fieldType.type === 'Identifier') {
            if (cur.fieldType?.value === targetTypeName) {
              references.push(cur.fieldType);
            }
            if (cur.fieldType?.value === fileName + '.' + targetTypeName) {
              references.push(cur.fieldType);
            }
          }
          if (cur.fieldType.type === 'ListType' || cur.fieldType.type === 'MapType') {
            const getNode = this.recurGetNode(cur.fieldType, targetTypeName);
            getNode && references.push(getNode);
          }
        });
      }
      if (p1Node.functions) {
        p1Node.functions.forEach((cur: any) => {
          if (cur.type === 'FunctionDefinition') {
            cur.fields.forEach((item: any) => {
              if (item.type === 'FieldDefinition' && item.fieldType.value === targetTypeName) {
                references.push(item.fieldType);
              }
              if (item.fieldType.type === 'ListType' || item.fieldType.type === 'MapType') {
                const getNode = this.recurGetNode(cur.fieldType, targetTypeName);
                getNode && references.push(getNode);
              }
            });
          }

          if (cur.returnType && cur.returnType.value === targetTypeName) {
            references.push(cur.returnType);
          }
        });
      }
    }
    return references;
  };

  recurGetNode = (node: any, targetName: string): any => {
    if (node.type === 'Identifier' && node?.value === targetName) {
      return node;
    }
    if ((node.type === 'ListType' || node.type === 'MapType') && node.valueType) {
      return this.recurGetNode(node.valueType, targetName);
    }
    return null;
  };

  findNodeByWord = (word: string) => {
    return this.filter(wordNodeFilter(word))[0];
  };

  findNodesByInput = (input: string) => {
    return this.filter((item, index) => {
      if (
        item.type !== SyntaxType.IncludeDefinition &&
        item.type !== SyntaxType.CppIncludeDefinition &&
        item.type !== SyntaxType.NamespaceDefinition &&
        item.name.value.toLocaleUpperCase().includes(input.trim().toLocaleUpperCase())
      ) {
        return item;
      }
    });
  };
}
