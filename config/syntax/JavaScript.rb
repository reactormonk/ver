# Encoding: UTF-8

{comment: "JavaScript Syntax: version 2.0",
 fileTypes: ["js", "htc", "jsx"],
 foldingStartMarker: 
  /^.*\bfunction\s*(?<_1>\w+\s*)?\([^\)]*\)(?<_2>\s*\{[^\}]*)?\s*$/,
 foldingStopMarker: /^\s*\}/,
 keyEquivalent: "^~J",
 name: "JavaScript",
 patterns: 
  [{captures: 
     {1 => {name: "support.class.js"},
      2 => {name: "support.constant.js"},
      3 => {name: "keyword.operator.js"}},
    comment: 
     "match stuff like: Sound.prototype = { … } when extending an object",
    match: /(?<_1>[a-zA-Z_?.$][\w?.$]*)\.(?<_2>prototype)\s*(?<_3>=)\s*/,
    name: "meta.class.js"},
   {captures: 
     {1 => {name: "support.class.js"},
      2 => {name: "support.constant.js"},
      3 => {name: "entity.name.function.js"},
      4 => {name: "keyword.operator.js"},
      5 => {name: "storage.type.function.js"},
      6 => {name: "punctuation.definition.parameters.begin.js"},
      7 => {name: "variable.parameter.function.js"},
      8 => {name: "punctuation.definition.parameters.end.js"}},
    comment: "match stuff like: Sound.prototype.play = function() { … }",
    match: 
     /(?<_1>[a-zA-Z_?.$][\w?.$]*)\.(?<_2>prototype)\.(?<_3>[a-zA-Z_?.$][\w?.$]*)\s*(?<_4>=)\s*(?<_5>function)?\s*(?<_6>\()(?<_7>.*?)(?<_8>\))/,
    name: "meta.function.prototype.js"},
   {captures: 
     {1 => {name: "support.class.js"},
      2 => {name: "support.constant.js"},
      3 => {name: "entity.name.function.js"},
      4 => {name: "keyword.operator.js"}},
    comment: "match stuff like: Sound.prototype.play = myfunc",
    match: 
     /(?<_1>[a-zA-Z_?.$][\w?.$]*)\.(?<_2>prototype)\.(?<_3>[a-zA-Z_?.$][\w?.$]*)\s*(?<_4>=)\s*/,
    name: "meta.function.js"},
   {captures: 
     {1 => {name: "support.class.js"},
      2 => {name: "entity.name.function.js"},
      3 => {name: "keyword.operator.js"},
      4 => {name: "storage.type.function.js"},
      5 => {name: "punctuation.definition.parameters.begin.js"},
      6 => {name: "variable.parameter.function.js"},
      7 => {name: "punctuation.definition.parameters.end.js"}},
    comment: "match stuff like: Sound.play = function() { … }",
    match: 
     /(?<_1>[a-zA-Z_?.$][\w?.$]*)\.(?<_2>[a-zA-Z_?.$][\w?.$]*)\s*(?<_3>=)\s*(?<_4>function)\s*(?<_5>\()(?<_6>.*?)(?<_7>\))/,
    name: "meta.function.js"},
   {captures: 
     {1 => {name: "entity.name.function.js"},
      2 => {name: "keyword.operator.js"},
      3 => {name: "storage.type.function.js"},
      4 => {name: "punctuation.definition.parameters.begin.js"},
      5 => {name: "variable.parameter.function.js"},
      6 => {name: "punctuation.definition.parameters.end.js"}},
    comment: "match stuff like: play = function() { … }",
    match: 
     /(?<_1>[a-zA-Z_?$][\w?$]*)\s*(?<_2>=)\s*(?<_3>function)\s*(?<_4>\()(?<_5>.*?)(?<_6>\))/,
    name: "meta.function.js"},
   {captures: 
     {1 => {name: "storage.type.function.js"},
      2 => {name: "entity.name.function.js"},
      3 => {name: "punctuation.definition.parameters.begin.js"},
      4 => {name: "variable.parameter.function.js"},
      5 => {name: "punctuation.definition.parameters.end.js"}},
    comment: "match regular function like: function myFunc(arg) { … }",
    match: 
     /\b(?<_1>function)\s+(?<_2>[a-zA-Z_$]\w*)?\s*(?<_3>\()(?<_4>.*?)(?<_5>\))/,
    name: "meta.function.js"},
   {captures: 
     {1 => {name: "entity.name.function.js"},
      2 => {name: "storage.type.function.js"},
      3 => {name: "punctuation.definition.parameters.begin.js"},
      4 => {name: "variable.parameter.function.js"},
      5 => {name: "punctuation.definition.parameters.end.js"}},
    comment: "match stuff like: foobar: function() { … }",
    match: 
     /\b(?<_1>[a-zA-Z_?.$][\w?.$]*)\s*:\s*\b(?<_2>function)?\s*(?<_3>\()(?<_4>.*?)(?<_5>\))/,
    name: "meta.function.json.js"},
   {captures: 
     {1 => {name: "string.quoted.single.js"},
      10 => {name: "punctuation.definition.parameters.begin.js"},
      11 => {name: "variable.parameter.function.js"},
      12 => {name: "punctuation.definition.parameters.end.js"},
      2 => {name: "punctuation.definition.string.begin.js"},
      3 => {name: "entity.name.function.js"},
      4 => {name: "punctuation.definition.string.end.js"},
      5 => {name: "string.quoted.double.js"},
      6 => {name: "punctuation.definition.string.begin.js"},
      7 => {name: "entity.name.function.js"},
      8 => {name: "punctuation.definition.string.end.js"},
      9 => {name: "entity.name.function.js"}},
    comment: "Attempt to match \"foo\": function",
    match: 
     /(?:(?<_1>(?<_2>')(?<_3>.*?)(?<_4>'))|(?<_5>(?<_6>")(?<_7>.*?)(?<_8>")))\s*:\s*\b(?<_9>function)?\s*(?<_10>\()(?<_11>.*?)(?<_12>\))/,
    name: "meta.function.json.js"},
   {captures: 
     {1 => {name: "keyword.operator.new.js"},
      2 => {name: "entity.name.type.instance.js"}},
    match: /(?<_1>new)\s+(?<_2>\w+(?:\.\w*)?)/,
    name: "meta.class.instance.constructor"},
   {match: /\b(?<_1>console)\b/, name: "entity.name.type.object.js.firebug"},
   {match: /\.(?<_1>warn|info|log|error|time|timeEnd|assert)\b/,
    name: "support.function.js.firebug"},
   {match: 
     /\b(?<_1>(?<_2>0(?<_3>x|X)[0-9a-fA-F]+)|(?<_4>[0-9]+(?<_5>\.[0-9]+)?))\b/,
    name: "constant.numeric.js"},
   {begin: /'/,
    beginCaptures: {0 => {name: "punctuation.definition.string.begin.js"}},
    end: "'",
    endCaptures: {0 => {name: "punctuation.definition.string.end.js"}},
    name: "string.quoted.single.js",
    patterns: 
     [{match: 
        /\\(?<_1>x\h{2}|[0-2][0-7]{,2}|3[0-6][0-7]?|37[0-7]?|[4-7][0-7]?|.)/,
       name: "constant.character.escape.js"}]},
   {begin: /"/,
    beginCaptures: {0 => {name: "punctuation.definition.string.begin.js"}},
    end: "\"",
    endCaptures: {0 => {name: "punctuation.definition.string.end.js"}},
    name: "string.quoted.double.js",
    patterns: 
     [{match: 
        /\\(?<_1>x\h{2}|[0-2][0-7]{,2}|3[0-6][0-7]|37[0-7]?|[4-7][0-7]?|.)/,
       name: "constant.character.escape.js"}]},
   {begin: /\/\*\*(?!\/)/,
    captures: {0 => {name: "punctuation.definition.comment.js"}},
    end: "\\*/",
    name: "comment.block.documentation.js"},
   {begin: /\/\*/,
    captures: {0 => {name: "punctuation.definition.comment.js"}},
    end: "\\*/",
    name: "comment.block.js"},
   {captures: {1 => {name: "punctuation.definition.comment.js"}},
    match: /(?<_1>\/\/).*$\n?/,
    name: "comment.line.double-slash.js"},
   {captures: 
     {0 => {name: "punctuation.definition.comment.html.js"},
      2 => {name: "punctuation.definition.comment.html.js"}},
    match: /(?<_1><!--|-->)/,
    name: "comment.block.html.js"},
   {match: 
     /\b(?<_1>boolean|byte|char|class|double|enum|float|function|int|interface|long|short|var|void)\b/,
    name: "storage.type.js"},
   {match: 
     /\b(?<_1>const|export|extends|final|implements|native|private|protected|public|static|synchronized|throws|transient|volatile)\b/,
    name: "storage.modifier.js"},
   {match: 
     /\b(?<_1>break|case|catch|continue|default|do|else|finally|for|goto|if|import|package|return|switch|throw|try|while)\b/,
    name: "keyword.control.js"},
   {match: /\b(?<_1>delete|in|instanceof|new|typeof|with)\b/,
    name: "keyword.operator.js"},
   {match: /\btrue\b/, name: "constant.language.boolean.true.js"},
   {match: /\bfalse\b/, name: "constant.language.boolean.false.js"},
   {match: /\bnull\b/, name: "constant.language.null.js"},
   {match: /\b(?<_1>super|this)\b/, name: "variable.language.js"},
   {match: /\b(?<_1>debugger)\b/, name: "keyword.other.js"},
   {match: 
     /\b(?<_1>Anchor|Applet|Area|Array|Boolean|Button|Checkbox|Date|document|event|FileUpload|Form|Frame|Function|Hidden|History|Image|JavaArray|JavaClass|JavaObject|JavaPackage|java|Layer|Link|Location|Math|MimeType|Number|navigator|netscape|Object|Option|Packages|Password|Plugin|Radio|RegExp|Reset|Select|String|Style|Submit|screen|sun|Text|Textarea|window|XMLHttpRequest)\b/,
    name: "support.class.js"},
   {match: 
     /\b(?<_1>s(?<_2>h(?<_3>ift|ow(?<_4>Mod(?<_5>elessDialog|alDialog)|Help))|croll(?<_6>X|By(?<_7>Pages|Lines)?|Y|To)?|t(?<_8>op|rike)|i(?<_9>n|zeToContent|debar|gnText)|ort|u(?<_10>p|b(?<_11>str(?<_12>ing)?)?)|pli(?<_13>ce|t)|e(?<_14>nd|t(?<_15>Re(?<_16>sizable|questHeader)|M(?<_17>i(?<_18>nutes|lliseconds)|onth)|Seconds|Ho(?<_19>tKeys|urs)|Year|Cursor|Time(?<_20>out)?|Interval|ZOptions|Date|UTC(?<_21>M(?<_22>i(?<_23>nutes|lliseconds)|onth)|Seconds|Hours|Date|FullYear)|FullYear|Active)|arch)|qrt|lice|avePreferences|mall)|h(?<_24>ome|andleEvent)|navigate|c(?<_25>har(?<_26>CodeAt|At)|o(?<_27>s|n(?<_28>cat|textual|firm)|mpile)|eil|lear(?<_29>Timeout|Interval)?|a(?<_30>ptureEvents|ll)|reate(?<_31>StyleSheet|Popup|EventObject))|t(?<_32>o(?<_33>GMTString|S(?<_34>tring|ource)|U(?<_35>TCString|pperCase)|Lo(?<_36>caleString|werCase))|est|a(?<_37>n|int(?<_38>Enabled)?))|i(?<_39>s(?<_40>NaN|Finite)|ndexOf|talics)|d(?<_41>isableExternalCapture|ump|etachEvent)|u(?<_42>n(?<_43>shift|taint|escape|watch)|pdateCommands)|j(?<_44>oin|avaEnabled)|p(?<_45>o(?<_46>p|w)|ush|lugins.refresh|a(?<_47>ddings|rse(?<_48>Int|Float)?)|r(?<_49>int|ompt|eference))|e(?<_50>scape|nableExternalCapture|val|lementFromPoint|x(?<_51>p|ec(?<_52>Script|Command)?))|valueOf|UTC|queryCommand(?<_53>State|Indeterm|Enabled|Value)|f(?<_54>i(?<_55>nd|le(?<_56>ModifiedDate|Size|CreatedDate|UpdatedDate)|xed)|o(?<_57>nt(?<_58>size|color)|rward)|loor|romCharCode)|watch|l(?<_59>ink|o(?<_60>ad|g)|astIndexOf)|a(?<_61>sin|nchor|cos|t(?<_62>tachEvent|ob|an(?<_63>2)?)|pply|lert|b(?<_64>s|ort))|r(?<_65>ou(?<_66>nd|teEvents)|e(?<_67>size(?<_68>By|To)|calc|turnValue|place|verse|l(?<_69>oad|ease(?<_70>Capture|Events)))|andom)|g(?<_71>o|et(?<_72>ResponseHeader|M(?<_73>i(?<_74>nutes|lliseconds)|onth)|Se(?<_75>conds|lection)|Hours|Year|Time(?<_76>zoneOffset)?|Da(?<_77>y|te)|UTC(?<_78>M(?<_79>i(?<_80>nutes|lliseconds)|onth)|Seconds|Hours|Da(?<_81>y|te)|FullYear)|FullYear|A(?<_82>ttention|llResponseHeaders)))|m(?<_83>in|ove(?<_84>B(?<_85>y|elow)|To(?<_86>Absolute)?|Above)|ergeAttributes|a(?<_87>tch|rgins|x))|b(?<_88>toa|ig|o(?<_89>ld|rderWidths)|link|ack))\b(?=\()/,
    name: "support.function.js"},
   {match: 
     /\b(?<_1>s(?<_2>ub(?<_3>stringData|mit)|plitText|e(?<_4>t(?<_5>NamedItem|Attribute(?<_6>Node)?)|lect))|has(?<_7>ChildNodes|Feature)|namedItem|c(?<_8>l(?<_9>ick|o(?<_10>se|neNode))|reate(?<_11>C(?<_12>omment|DATASection|aption)|T(?<_13>Head|extNode|Foot)|DocumentFragment|ProcessingInstruction|E(?<_14>ntityReference|lement)|Attribute))|tabIndex|i(?<_15>nsert(?<_16>Row|Before|Cell|Data)|tem)|open|delete(?<_17>Row|C(?<_18>ell|aption)|T(?<_19>Head|Foot)|Data)|focus|write(?<_20>ln)?|a(?<_21>dd|ppend(?<_22>Child|Data))|re(?<_23>set|place(?<_24>Child|Data)|move(?<_25>NamedItem|Child|Attribute(?<_26>Node)?)?)|get(?<_27>NamedItem|Element(?<_28>sBy(?<_29>Name|TagName)|ById)|Attribute(?<_30>Node)?)|blur)\b(?=\()/,
    name: "support.function.dom.js"},
   {match: 
     /(?<=\.)(?<_1>s(?<_2>ystemLanguage|cr(?<_3>ipts|ollbars|een(?<_4>X|Y|Top|Left))|t(?<_5>yle(?<_6>Sheets)?|atus(?<_7>Text|bar)?)|ibling(?<_8>Below|Above)|ource|uffixes|e(?<_9>curity(?<_10>Policy)?|l(?<_11>ection|f)))|h(?<_12>istory|ost(?<_13>name)?|as(?<_14>h|Focus))|y|X(?<_15>MLDocument|SLDocument)|n(?<_16>ext|ame(?<_17>space(?<_18>s|URI)|Prop))|M(?<_19>IN_VALUE|AX_VALUE)|c(?<_20>haracterSet|o(?<_21>n(?<_22>structor|trollers)|okieEnabled|lorDepth|mp(?<_23>onents|lete))|urrent|puClass|l(?<_24>i(?<_25>p(?<_26>boardData)?|entInformation)|osed|asses)|alle(?<_27>e|r)|rypto)|t(?<_28>o(?<_29>olbar|p)|ext(?<_30>Transform|Indent|Decoration|Align)|ags)|SQRT(?<_31>1_2|2)|i(?<_32>n(?<_33>ner(?<_34>Height|Width)|put)|ds|gnoreCase)|zIndex|o(?<_35>scpu|n(?<_36>readystatechange|Line)|uter(?<_37>Height|Width)|p(?<_38>sProfile|ener)|ffscreenBuffering)|NEGATIVE_INFINITY|d(?<_39>i(?<_40>splay|alog(?<_41>Height|Top|Width|Left|Arguments)|rectories)|e(?<_42>scription|fault(?<_43>Status|Ch(?<_44>ecked|arset)|View)))|u(?<_45>ser(?<_46>Profile|Language|Agent)|n(?<_47>iqueID|defined)|pdateInterval)|_content|p(?<_48>ixelDepth|ort|ersonalbar|kcs11|l(?<_49>ugins|atform)|a(?<_50>thname|dding(?<_51>Right|Bottom|Top|Left)|rent(?<_52>Window|Layer)?|ge(?<_53>X(?<_54>Offset)?|Y(?<_55>Offset)?))|r(?<_56>o(?<_57>to(?<_58>col|type)|duct(?<_59>Sub)?|mpter)|e(?<_60>vious|fix)))|e(?<_61>n(?<_62>coding|abledPlugin)|x(?<_63>ternal|pando)|mbeds)|v(?<_64>isibility|endor(?<_65>Sub)?|Linkcolor)|URLUnencoded|P(?<_66>I|OSITIVE_INFINITY)|f(?<_67>ilename|o(?<_68>nt(?<_69>Size|Family|Weight)|rmName)|rame(?<_70>s|Element)|gColor)|E|whiteSpace|l(?<_71>i(?<_72>stStyleType|n(?<_73>eHeight|kColor))|o(?<_74>ca(?<_75>tion(?<_76>bar)?|lName)|wsrc)|e(?<_77>ngth|ft(?<_78>Context)?)|a(?<_79>st(?<_80>M(?<_81>odified|atch)|Index|Paren)|yer(?<_82>s|X)|nguage))|a(?<_83>pp(?<_84>MinorVersion|Name|Co(?<_85>deName|re)|Version)|vail(?<_86>Height|Top|Width|Left)|ll|r(?<_87>ity|guments)|Linkcolor|bove)|r(?<_88>ight(?<_89>Context)?|e(?<_90>sponse(?<_91>XML|Text)|adyState))|global|x|m(?<_92>imeTypes|ultiline|enubar|argin(?<_93>Right|Bottom|Top|Left))|L(?<_94>N(?<_95>10|2)|OG(?<_96>10E|2E))|b(?<_97>o(?<_98>ttom|rder(?<_99>RightWidth|BottomWidth|Style|Color|TopWidth|LeftWidth))|ufferDepth|elow|ackground(?<_100>Color|Image)))\b/,
    name: "support.constant.js"},
   {match: 
     /(?<=\.)(?<_1>s(?<_2>hape|ystemId|c(?<_3>heme|ope|rolling)|ta(?<_4>ndby|rt)|ize|ummary|pecified|e(?<_5>ctionRowIndex|lected(?<_6>Index)?)|rc)|h(?<_7>space|t(?<_8>tpEquiv|mlFor)|e(?<_9>ight|aders)|ref(?<_10>lang)?)|n(?<_11>o(?<_12>Resize|tation(?<_13>s|Name)|Shade|Href|de(?<_14>Name|Type|Value)|Wrap)|extSibling|ame)|c(?<_15>h(?<_16>ildNodes|Off|ecked|arset)?|ite|o(?<_17>ntent|o(?<_18>kie|rds)|de(?<_19>Base|Type)?|l(?<_20>s|Span|or)|mpact)|ell(?<_21>s|Spacing|Padding)|l(?<_22>ear|assName)|aption)|t(?<_23>ype|Bodies|itle|Head|ext|a(?<_24>rget|gName)|Foot)|i(?<_25>sMap|ndex|d|m(?<_26>plementation|ages))|o(?<_27>ptions|wnerDocument|bject)|d(?<_28>i(?<_29>sabled|r)|o(?<_30>c(?<_31>type|umentElement)|main)|e(?<_32>clare|f(?<_33>er|ault(?<_34>Selected|Checked|Value)))|at(?<_35>eTime|a))|useMap|p(?<_36>ublicId|arentNode|r(?<_37>o(?<_38>file|mpt)|eviousSibling))|e(?<_39>n(?<_40>ctype|tities)|vent|lements)|v(?<_41>space|ersion|alue(?<_42>Type)?|Link|Align)|URL|f(?<_43>irstChild|orm(?<_44>s)?|ace|rame(?<_45>Border)?)|width|l(?<_46>ink(?<_47>s)?|o(?<_48>ngDesc|wSrc)|a(?<_49>stChild|ng|bel))|a(?<_50>nchors|c(?<_51>ce(?<_52>ssKey|pt(?<_53>Charset)?)|tion)|ttributes|pplets|l(?<_54>t|ign)|r(?<_55>chive|eas)|xis|Link|bbr)|r(?<_56>ow(?<_57>s|Span|Index)|ules|e(?<_58>v|ferrer|l|adOnly))|m(?<_59>ultiple|e(?<_60>thod|dia)|a(?<_61>rgin(?<_62>Height|Width)|xLength))|b(?<_63>o(?<_64>dy|rder)|ackground|gColor))\b/,
    name: "support.constant.dom.js"},
   {match: 
     /\b(?<_1>ELEMENT_NODE|ATTRIBUTE_NODE|TEXT_NODE|CDATA_SECTION_NODE|ENTITY_REFERENCE_NODE|ENTITY_NODE|PROCESSING_INSTRUCTION_NODE|COMMENT_NODE|DOCUMENT_NODE|DOCUMENT_TYPE_NODE|DOCUMENT_FRAGMENT_NODE|NOTATION_NODE|INDEX_SIZE_ERR|DOMSTRING_SIZE_ERR|HIERARCHY_REQUEST_ERR|WRONG_DOCUMENT_ERR|INVALID_CHARACTER_ERR|NO_DATA_ALLOWED_ERR|NO_MODIFICATION_ALLOWED_ERR|NOT_FOUND_ERR|NOT_SUPPORTED_ERR|INUSE_ATTRIBUTE_ERR)\b/,
    name: "support.constant.dom.js"},
   {match: 
     /\bon(?<_1>R(?<_2>ow(?<_3>s(?<_4>inserted|delete)|e(?<_5>nter|xit))|e(?<_6>s(?<_7>ize(?<_8>start|end)?|et)|adystatechange))|Mouse(?<_9>o(?<_10>ut|ver)|down|up|move)|B(?<_11>efore(?<_12>cut|deactivate|u(?<_13>nload|pdate)|p(?<_14>aste|rint)|editfocus|activate)|lur)|S(?<_15>croll|top|ubmit|elect(?<_16>start|ionchange)?)|H(?<_17>over|elp)|C(?<_18>hange|ont(?<_19>extmenu|rolselect)|ut|ellchange|l(?<_20>ick|ose))|D(?<_21>eactivate|ata(?<_22>setc(?<_23>hanged|omplete)|available)|r(?<_24>op|ag(?<_25>start|over|drop|en(?<_26>ter|d)|leave)?)|blclick)|Unload|P(?<_27>aste|ropertychange)|Error(?<_28>update)?|Key(?<_29>down|up|press)|Focus|Load|A(?<_30>ctivate|fter(?<_31>update|print)|bort))\b/,
    name: "support.function.event-handler.js"},
   {match: 
     /!|\$|%|&|\*|\-\-|\-|\+\+|\+|~|===|==|=|!=|!==|<=|>=|<<=|>>=|>>>=|<>|<|>|!|&&|\|\||\?\:|\*=|(?<!\()\/=|%=|\+=|\-=|&=|\^=|\b(?<_1>in|instanceof|new|delete|typeof|void)\b/,
    name: "keyword.operator.js"},
   {match: /\b(?<_1>Infinity|NaN|undefined)\b/, name: "constant.language.js"},
   {begin: /(?<=[=(?<_1>:]|^|return)\s*(?<_2>\/)(?![\/*+{}?])/,
    beginCaptures: {1 => {name: "punctuation.definition.string.begin.js"}},
    end: "(/)[igm]*",
    endCaptures: {1 => {name: "punctuation.definition.string.end.js"}},
    name: "string.regexp.js",
    patterns: [{match: /\\./, name: "constant.character.escape.js"}]},
   {match: /\;/, name: "punctuation.terminator.statement.js"},
   {match: /,[ |\t]*/, name: "meta.delimiter.object.comma.js"},
   {match: /\./, name: "meta.delimiter.method.period.js"},
   {match: /\{|\}/, name: "meta.brace.curly.js"},
   {match: /\(|\)/, name: "meta.brace.round.js"},
   {match: /\[|\]/, name: "meta.brace.square.js"}],
 scopeName: "source.js",
 uuid: "93E017CC-6F27-11D9-90EB-000D93589AF6"}
