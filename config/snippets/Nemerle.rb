# Encoding: UTF-8

[{content: "abstract ",
  name: "abstract",
  scope: "source.nemerle",
  tabTrigger: "abs",
  uuid: "FACB8477-4FB6-11DB-ADD3-00112474B8F0"},
 {content: "class ${1:name}{\n\tpublic this(${2:args}){\n\t\t$3\n\t}\n}",
  name: "class",
  scope: "source.nemerle",
  tabTrigger: "class",
  uuid: "0ED94763-4FB4-11DB-ADD3-00112474B8F0"},
 {content: "if (${1:condition}){\n\t$2\n} else {\n\t$3\n}",
  name: "if ... else",
  scope: "source.nemerle",
  tabTrigger: "if",
  uuid: "7EDF2719-4EF3-11DB-BFFE-00112474B8F0"},
 {content: "when (${1:condition}){\n\t$2\n}\n",
  name: "when",
  scope: "source.nemerle",
  tabTrigger: "when",
  uuid: "E4B3CF04-4EF2-11DB-BFFE-00112474B8F0"},
 {content: "do{\n\t$2\n} while (${1:condition})\n",
  name: "do ... while",
  scope: "source.nemerle",
  tabTrigger: "do",
  uuid: "F1282535-4FB2-11DB-ADD3-00112474B8F0"},
 {content: "enum ${1:name}{\n\t| $2\n}",
  name: "enum",
  scope: "source.nemerle",
  tabTrigger: "enum",
  uuid: "F4976134-4FB3-11DB-ADD3-00112474B8F0"},
 {content: 
   "try{\n\t$1\n} catch {\n| ${2:name} is ${3:type} => $4\n} finally {\n\t$5\n}\n",
  name: "try ... catch ...  finally",
  scope: "source.nemerle",
  tabTrigger: "try",
  uuid: "4FC377A6-4EF7-11DB-96B0-00112474B8F0"},
 {content: "interface ${1:name}{\n\t$2\n}\n",
  name: "interface",
  scope: "source.nemerle",
  tabTrigger: "inter",
  uuid: "4D813432-4FB5-11DB-ADD3-00112474B8F0"},
 {content: 
   "for (mutable ${1:name}=${2:value}; ${3:condition}; $1++){\n\t$4\n}",
  name: "for",
  scope: "source.nemerle",
  tabTrigger: "for",
  uuid: "1E6C8066-4EF4-11DB-BFFE-00112474B8F0"},
 {content: "foreach (${1:mutable} in ${2:collection}){\n\t$3\n}\n",
  name: "foreach",
  scope: "source.nemerle",
  tabTrigger: "fore",
  uuid: "88762D83-4EF4-11DB-BFFE-00112474B8F0"},
 {content: "macro ${1:name}\n\tsyntax(\"$1\",\"$2\"){\n\t$3\n}",
  name: "macro",
  scope: "source.nemerle",
  tabTrigger: "macro",
  uuid: "37B85B58-4FB5-11DB-ADD3-00112474B8F0"},
 {content: "match (${1:value}){\n| ${2:value} => $3\n}",
  name: "match",
  scope: "source.nemerle",
  tabTrigger: "match",
  uuid: "EA762083-4FB4-11DB-ADD3-00112474B8F0"},
 {content: "module Main{\n\tMain(${1:args}):void{\n\t\t$2\n\t}\n}",
  name: "module Main",
  scope: "source.nemerle",
  tabTrigger: "Module",
  uuid: "B1EA0FF4-4EED-11DB-98A4-00112474B8F0"},
 {content: "module ${1:name}{\n\t$2\n}",
  name: "module",
  scope: "source.nemerle",
  tabTrigger: "module",
  uuid: "42FC2BCE-4FB4-11DB-ADD3-00112474B8F0"},
 {content: "mutable ${1:name}",
  name: "mutable",
  scope: "source.nemerle",
  tabTrigger: "mu",
  uuid: "CB634D17-4EEF-11DB-BFFE-00112474B8F0"},
 {content: "override ",
  name: "override",
  scope: "source.nemerle",
  tabTrigger: "ove",
  uuid: "18F3B13B-4FB7-11DB-ADD3-00112474B8F0"},
 {content: "private ",
  name: "private",
  scope: "source.nemerle",
  tabTrigger: "pri",
  uuid: "20AB5B00-4FBC-11DB-ADD3-00112474B8F0"},
 {content: "public ",
  name: "public",
  scope: "source.nemerle",
  tabTrigger: "pub",
  uuid: "AAE942CC-4FB7-11DB-ADD3-00112474B8F0"},
 {content: "repeat (${1:times}){\n\t$2\n}",
  name: "repeat",
  scope: "source.nemerle",
  tabTrigger: "repeat",
  uuid: "3B7CED7C-4FB3-11DB-ADD3-00112474B8F0"},
 {content: "sealed ",
  name: "sealed",
  scope: "source.nemerle",
  tabTrigger: "sea",
  uuid: "9ABF6A2E-4FB7-11DB-ADD3-00112474B8F0"},
 {content: "static ",
  name: "static",
  scope: "source.nemerle",
  tabTrigger: "sta",
  uuid: "3874B58C-4FCA-11DB-9913-00112474B8F0"},
 {content: "unless (${1:condition}){\n\t$2\n}",
  name: "unless",
  scope: "source.nemerle",
  tabTrigger: "unless",
  uuid: "7A1A7BDC-4EEE-11DB-98A4-00112474B8F0"},
 {content: "variant ${1:name}{\n\t| $2\n}",
  name: "variant",
  scope: "source.nemerle",
  tabTrigger: "variant",
  uuid: "CA56A88B-4FB3-11DB-ADD3-00112474B8F0"},
 {content: "virtual ",
  name: "virtual",
  scope: "source.nemerle",
  tabTrigger: "vir",
  uuid: "25AFE9B6-4FB7-11DB-ADD3-00112474B8F0"},
 {content: "while (${1:condition}){\n\t$2\n}",
  name: "while",
  scope: "source.nemerle",
  tabTrigger: "while",
  uuid: "55DA2FDA-4FB2-11DB-ADD3-00112474B8F0"}]
