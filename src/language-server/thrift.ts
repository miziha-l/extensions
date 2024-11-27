export const snippets: any = {
  'Thrift Include': {
    prefix: 'include',
    body: ['include "${1:file.thrift}"'],
    description: 'Thrift Include File',
  },
  'Thrift Namespace': {
    prefix: 'namespace',
    body: ['namespace ${1:language} ${2:identifier}'],
    description: 'Thrift Namespace Definition',
  },
  'Thrift Typedef': {
    prefix: 'typedef',
    body: ['typedef ${1:existing_type} ${2:new_type}'],
    description: 'Thrift Typedef',
  },
  'Thrift Enum': {
    prefix: 'enum',
    body: ['enum ${1:EnumName} {', '  ${2:VALUE_ONE} = ${3:1},', '  ${4:VALUE_TWO} = ${5:2}', '}'],
    description: 'Thrift Enum',
  },
  'Thrift Struct': {
    prefix: 'struct',
    body: ['struct ${1:StructName} {', '  ${2:type} ${3:name} = ${4:id};', '}'],
    description: 'Thrift Struct',
  },
  'Thrift Union': {
    prefix: 'union',
    body: ['union ${1:UnionName} {', '  ${2:type} ${3:name} = ${4:id};', '}'],
    description: 'Thrift Union',
  },
  'Thrift Exception': {
    prefix: 'exception',
    body: ['exception ${1:ExceptionName} {', '  ${2:type} ${3:name} = ${4:id};', '}'],
    description: 'Thrift Exception',
  },
  'Thrift Extends': {
    prefix: 'extends',
    body: ['extends ${1:BaseService}'],
    description: 'Thrift Extends',
  },
  'Thrift Service': {
    prefix: 'service',
    body: ['service ${1:ServiceName} {', '  ${2:void} ${3:methodName}(${4:args});', '}'],
    description: 'Thrift Service',
  },
  'Thrift Required': {
    prefix: 'required',
    body: ['required ${1:type} ${2:name}'],
    description: 'Thrift Required Field',
  },
  'Thrift Optional': {
    prefix: 'optional',
    body: ['optional ${1:type} ${2:name}'],
    description: 'Thrift Optional Field',
  },
  'Thrift Oneway': {
    prefix: 'oneway',
    body: ['oneway ${1:type} ${2:name}'],
    description: 'Thrift Oneway',
  },
  'Thrift Void': {
    prefix: 'void',
    body: ['void ${1:functionName}()'],
    description: 'Thrift Void Function',
  },
  'Thrift Throws': {
    prefix: 'throws',
    body: ['throws (${1:ExceptionType} ${2:ex})'],
    description: 'Thrift Throws Clause',
  },
  'Thrift Bool': {
    prefix: 'bool',
    body: ['bool ${1:variableName}'],
    description: 'Thrift Bool Type',
  },
  'Thrift Byte': {
    prefix: 'byte',
    body: ['byte ${1:variableName}'],
    description: 'Thrift Byte Type',
  },
  'Thrift i8': {
    prefix: 'i8',
    body: ['i8 ${1:variableName}'],
    description: 'Thrift i8 Type',
  },
  'Thrift i16': {
    prefix: 'i16',
    body: ['i16 ${1:variableName}'],
    description: 'Thrift i16 Type',
  },
  'Thrift i32': {
    prefix: 'i32',
    body: ['i32 ${1:variableName}'],
    description: 'Thrift i32 Type',
  },
  'Thrift i64': {
    prefix: 'i64',
    body: ['i64 ${1:variableName}'],
    description: 'Thrift i64 Type',
  },
  'Thrift Double': {
    prefix: 'double',
    body: ['double ${1:variableName}'],
    description: 'Thrift Double Type',
  },
  'Thrift String': {
    prefix: 'string',
    body: ['string ${1:variableName}'],
    description: 'Thrift String Type',
  },
  'Thrift Binary': {
    prefix: 'binary',
    body: ['binary ${1:variableName}'],
    description: 'Thrift Binary Type',
  },
  'Thrift Slist': {
    prefix: 'slist',
    body: ['slist<${1:type}> ${2:variableName}'],
    description: 'Thrift Slist',
  },
  'Thrift Map': {
    prefix: 'map',
    body: ['map<${1:keyType}, ${2:valueType}> ${3:mapName}'],
    description: 'Thrift Map',
  },
  'Thrift Set': {
    prefix: 'set',
    body: ['set<${1:type}> ${2:setName}'],
    description: 'Thrift Set',
  },
  'Thrift List': {
    prefix: 'list',
    body: ['list<${1:type}> ${2:listName}'],
    description: 'Thrift List',
  },
};
