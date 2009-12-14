# Encoding: UTF-8

{fileTypes: ["sml", "sig"],
 foldingStartMarker: /\(\*|\b(struct|sig)\b/,
 foldingStopMarker: /\*\)|\bend\b/,
 keyEquivalent: /^~S/,
 name: "Standard ML",
 patterns: 
  [{include: "#comments"},
   {match: 
     /\b(val|datatype|struct|as|let|in|abstype|local|where|case|of|fn|raise|exception|handle|ref|infix|infixr|before|end|structure|withtype)\b/,
    name: "keyword.other.ml"},
   {begin: /\b(let)\b/,
    captures: 
     {1 => {name: "keyword.other.ml"}, 2 => {name: "keyword.other.ml"}},
    end: "\\b(end)\\b",
    name: "meta.exp.let.ml",
    patterns: [{include: "$self"}]},
   {begin: /\b(sig)\b/,
    captures: 
     {1 => {name: "keyword.other.delimiter.ml"},
      2 => {name: "keyword.other.delimiter.ml"}},
    end: "\\b(end)\\b",
    name: "meta.module.sigdec.ml",
    patterns: [{include: "#spec"}]},
   {match: /\b(if|then|else)\b/, name: "keyword.control.ml"},
   {begin: /\b(fun|and)\s+([\w]+)\b/,
    captures: 
     {1 => {name: "keyword.control.fun.ml"},
      2 => {name: "entity.name.function.ml"}},
    end: "(?=val|type|eqtype|datatype|structure|local)",
    name: "meta.definition.fun.ml",
    patterns: [{include: "source.ml"}]},
   {begin: /"/,
    beginCaptures: {0 => {name: "punctuation.definition.string.begin.ml"}},
    end: "\"",
    endCaptures: {0 => {name: "punctuation.definition.string.end.ml"}},
    name: "string.quoted.double.ml",
    patterns: [{match: /\\./, name: "constant.character.escape.ml"}]},
   {captures: 
     {1 => {name: "punctuation.definition.constant.ml"},
      3 => {name: "punctuation.definition.constant.ml"}},
    match: /(#")(\\)?.(")/,
    name: "constant.character.ml"},
   {match: /\b\d*\.?\d+\b/, name: "constant.numeric.ml"},
   {match: /\b(andalso|orelse|not)\b/, name: "keyword.operator.logical.ml"},
   {begin: 
     /(?x)\b
	(functor|structure|signature|funsig)\s+
	(\w+)\s* # identifier/,
    captures: 
     {1 => {name: "storage.type.module.binder.ml"},
      2 => {name: "entity.name.type.module.ml"}},
    end: "(?==|:|\\()",
    name: "meta.module.dec.ml"},
   {match: /\b(open)\b/, name: "keyword.other.module.ml"},
   {match: /\b(nil|true|false|NONE|SOME)\b/, name: "constant.language.ml"},
   {begin: /\s*(type|eqtype) .* =/,
    captures: 
     {1 => {name: "keyword.other.typeabbrev.ml"},
      2 => {name: "variable.other.typename.ml"}},
    end: "$",
    name: "meta.typeabbrev.ml",
    patterns: 
     [{match: /(([a-zA-Z0-9\.\* ]|(\->))*)/, name: "meta.typeexp.ml"}]}],
 repository: 
  {comments: 
    {patterns: 
      [{begin: /\(\*/,
        captures: {0 => {name: "punctuation.definition.comment.ml"}},
        end: "\\*\\)",
        name: "comment.block.ml",
        patterns: [{include: "#comments"}]}]},
   spec: 
    {patterns: 
      [{captures: 
         {1 => {name: "keyword.other.ml"},
          2 => {name: "entity.name.type.abbrev.ml"}},
        match: /\b(exception|type)\s+([a-zA-Z][a-zA-Z0-9'_]*)/,
        name: "meta.spec.ml.type"},
       {begin: /\b(datatype)\s+([a-zA-Z][a-zA-Z0-9'_]*)\s*(?==)/,
        captures: 
         {1 => {name: "keyword.other.ml"},
          2 => {name: "entity.name.type.datatype.ml"}},
        end: "(?=val|type|eqtype|datatype|structure|include|exception)",
        name: "meta.spec.ml.datatype",
        patterns: 
         [{captures: 
            {1 => {name: "keyword.other.ml"},
             2 => {name: "entity.name.type.datatype.ml"}},
           match: /\b(and)\s+([a-zA-Z][a-zA-Z0-9'_]*)\s*(?==)/,
           name: "meta.spec.ml.datatype"},
          {captures: 
            {1 => {name: "variable.other.dcon.ml"},
             2 => {name: "keyword.other.ml"}},
           match: /(?x)
	=\s*([a-zA-Z][a-zA-Z0-9'_]*)(\s+of)?/,
           name: "meta.datatype.rule.main.ml"},
          {captures: 
            {1 => {name: "variable.other.dcon.ml"},
             2 => {name: "keyword.other.ml"}},
           match: /\|\s*([a-zA-Z][a-zA-Z0-9'_]*)(\s+of)?/,
           name: "meta.datatype.rule.other.ml"}]},
       {captures: {1 => {name: "keyword.other.ml"}},
        match: /\b(val)\s*([^:]+)\s*:/,
        name: "meta.spec.ml.val"},
       {begin: /\b(structure)\s*(\w+)\s*:/,
        captures: 
         {1 => {name: "keyword.other.ml"},
          2 => {name: "entity.name.type.module.ml"}},
        end: "(?=val|type|eqtype|datatype|structure|include)",
        name: "meta.spec.ml.structure",
        patterns: [{match: /\b(sharing)\b/, name: "keyword.other.ml"}]},
       {captures: {1 => {name: "keyword.other.ml"}},
        match: /\b(include)\b/,
        name: "meta.spec.ml.include"},
       {include: "#comments"}]}},
 scopeName: "source.ml",
 uuid: "9B148AEA-F723-4EDE-8B7F-2F4FD730BC3A"}