# Encoding: UTF-8

[{name: "Named Code Blocks in Symbol List",
  scope: "meta.block.parameters.sweave",
  settings: 
   {showInSymbolList: 1,
    symbolTransformation: 
     "\n\t\ts/^<<.*?(?:label=)\\s*([^\\s,>]*)\\s*(?:,.*)?>>$/R: $1/; # explicit label\n\t\ts/^<<\\s*([^\\s,>=]+)\\s*(?:,.*>>|>>)$/R: $1/; # First entry is a label\n\ts/^<<.*>>//; # Everything else just wont show up\n\t"},
  uuid: "6677D67A-999F-4F29-8151-3308967D51D7"},
 {name: "comment preferences",
  scope: "text.sweave",
  settings: 
   {shellVariables: 
     [{name: "TM_COMMENT_START", value: "% "},
      {name: "TM_COMMENT_END", value: ""},
      {name: "TM_COMMENT_MODE", value: "line"}]},
  uuid: "B8C8B6BC-F038-40AB-BADF-F708DAC51F4D"}]
