import { organize } from './organizer'
import { createParser, Parser } from './parser'
import { createScanner, Scanner } from './scanner'
import {
    ErrorType,
    SyntaxType,
    ThriftDocument,
    ThriftError,
    ThriftErrors,
    Token,
} from './types'

export * from './types'
export * from './factory'
export { createScanner } from './scanner'
export { createParser } from './parser'

export interface ParseOptions {
    fastFail: boolean
    rootDir: string
    outDir: string
    files: Array<string>
    organize: boolean
}

export const defaultOptions: ParseOptions = {
    fastFail: false,
    rootDir: '.',
    outDir: '.',
    files: [],
    organize: true,
}

export function parse(
    source: string,
    options: Partial<ParseOptions> = {},
): ThriftDocument | ThriftErrors {    
    const mergedOptions: ParseOptions = { ...defaultOptions, ...options }
    // const debug: Debugger = createDebugger(source)
    const scanner: Scanner = createScanner(source)
    const tokens: Array<Token> = scanner.scan()

    const parser: Parser = createParser(tokens)
    const intermediate: ThriftDocument = parser.parse()
    const thrift: ThriftDocument = mergedOptions.organize
        ? organize(intermediate)
        : intermediate
    return thrift
}
