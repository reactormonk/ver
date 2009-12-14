# Encoding: UTF-8

[{name: "Indent rules",
  scope: "source.ocaml",
  settings: 
   {decreaseIndentPattern: 
     "^\\s*(end|done|with|in|else)\\b|^\\s*;;|^[^\\(\"]*\\)",
    increaseIndentPattern: 
     "^.*(\\([^)\"\\n]*|begin)$|\\bobject\\s*$|\\blet [a-zA-Z0-9_-]+( [^ ]+)+ =\\s*$|method[ \\t]+.*=[ \\t]*$|->[ \\t]*$|\\b(for|while)[ \\t]+.*[ \\t]+do[ \\t]*$|(\\btry$|\\bif\\s+.*\\sthen$|\\belse|[:=]\\s*sig|=\\s*struct)\\s*$",
    indentNextLinePattern: 
     "(?!\\bif.*then.*(else.*|(;|[ \\t]in)[ \\t]*$))\\bif|\\bthen[ \\t]*$|\\belse[ \\t]*$$"},
  uuid: "AD257FE4-8F09-4FE6-A0C3-CD5E15F75C5D"},
 {name: "Comments",
  scope: "source.ocaml",
  settings: 
   {shellVariables: 
     [{name: "TM_COMMENT_START", value: "(* "},
      {name: "TM_COMMENT_END", value: " *)"}]},
  uuid: "4C99F5E7-F7D2-47A3-B232-C1E99C828F5D"},
 {name: "Typing/highlight pairs",
  scope: "source.ocaml",
  settings: 
   {highlightPairs: [["(", ")"], ["[", "]"], ["{", "}"]],
    smartTypingPairs: [["(", ")"], ["[", "]"], ["{", "}"], ["\"", "\""]]},
  uuid: "1C41964E-2B51-400B-8010-A6F682FA57EE"},
 {name: "Symbol List: Classes",
  scope: "entity.name.type.class.ocaml",
  settings: {showInSymbolList: 1, symbolTransformation: "s/^/class: /"},
  uuid: "72C6F9CD-7D1F-4956-8451-22F35339ABAB"},
 {name: "Symbol List: Exceptions",
  scope: "entity.name.type.exception.ocaml",
  settings: {showInSymbolList: 1, symbolTransformation: "s/^/exception: /"},
  uuid: "5852E31D-A343-4FD5-953A-76996068C515"},
 {name: "Symbol List: Ocamllex pattern definition",
  scope: "entity.name.type.pattern.stupid-goddamn-hack.ocamllex",
  settings: {showInSymbolList: 1, symbolTransformation: "s/^/pattern: /"},
  uuid: "52F126D8-181E-4A22-ABD4-831550FF28AD"},
 {name: "Symbol List: Ocamllex pattern references",
  scope: "entity.name.type.pattern.reference.stupid-goddamn-hack.ocamllex",
  settings: {showInSymbolList: 0},
  uuid: "4CCB042A-DC5F-4D03-8BD5-96B91397A458"},
 {name: "Symbol List: Ocamllex rules",
  scope: "entity.name.function.entrypoint.ocamllex",
  settings: {showInSymbolList: 1, symbolTransformation: "s/^/entrypoint: /"},
  uuid: "B13DEBC9-0853-42D6-882E-E38F213BD337"},
 {name: "Symbol List: Ocamlyacc non-terminal definition",
  scope: "entity.name.function.non-terminal.ocamlyacc",
  settings: {showInSymbolList: 1, symbolTransformation: "s/^/non-terminal: /"},
  uuid: "2169BE86-FF3F-42AD-A396-82905FBF336A"},
 {name: "Symbol List: Ocamlyacc non-terminal reference",
  scope: "entity.name.function.non-terminal.reference.ocamlyacc",
  settings: {showInSymbolList: 0},
  uuid: "AC8A21BC-AE1F-4213-AFC1-29EB62E72ABE"},
 {name: "Symbol List: Ocamlyacc token definition",
  scope: "entity.name.type.token.ocamlyacc",
  settings: {showInSymbolList: 1, symbolTransformation: "s/^/token: /"},
  uuid: "018D26CA-0A0B-492A-B18D-25F518C7AE09"},
 {name: "Symbol List: Ocamlyacc token reference",
  scope: "entity.name.type.token.reference.ocamlyacc",
  settings: {showInSymbolList: 0},
  uuid: "1CB2410B-4D16-48C6-96B8-D3580ECD280D"},
 {name: "Symbol List: Types",
  scope: "storage.type.user-defined.ocaml",
  settings: {showInSymbolList: 1, symbolTransformation: "s/^/type: /"},
  uuid: "3605208D-9963-4F10-A4BC-C0EF15B84BCF"},
 {name: "Symbol List: Variants",
  scope: 
   "entity.name.type.variant.ocaml | entity.name.type.variant.polymorphic.ocaml",
  settings: {showInSymbolList: 0},
  uuid: "A40FC961-E731-454E-AEB3-0B7307EF17E0"}]