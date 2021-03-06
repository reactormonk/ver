# Encoding: UTF-8

[{name: "Comments",
  scope: "source.c, source.c++, source.objc, source.objc++",
  settings: 
   {shellVariables: 
     [{name: "TM_COMMENT_START", value: "// "},
      {name: "TM_COMMENT_START_2", value: "/*"},
      {name: "TM_COMMENT_END_2", value: "*/"},
      {name: "TM_COMMENT_DISABLE_INDENT_2", value: "yes"}]},
  uuid: "38DBCCE5-2005-410C-B7D7-013097751AC8"},
 {name: "Header Completion (System)",
  scope: "meta.preprocessor.c.include string.quoted.other.lt-gt.include",
  settings: 
   {completionCommand: 
     "#!/usr/bin/env ruby -wKU\n\nUSR_HEAD  = Regexp.escape \"#include \\\"...\\\" search starts here:\\n\"\nSYS_HEAD  = Regexp.escape \"#include <...> search starts here:\\n\"\nFOOTER    = Regexp.escape \"End of search list.\"\n\nCOMPILER  = {\n  \"source.c\"      => \"gcc 2>&1 >/dev/null -E -v -x c /dev/null\",\n  \"source.c++\"    => \"g++ 2>&1 >/dev/null -E -v -x c++ /dev/null\",\n  \"source.objc\"   => \"gcc 2>&1 >/dev/null -E -v -x objective-c /dev/null\",\n  \"source.objc++\" => \"g++ 2>&1 >/dev/null -E -v -x objective-c++ /dev/null\",\n}\n\ndef compiler_search_path(domain = :system)\n  scope        = \"source.c\"\n  scope        = $& if ENV[\"TM_SCOPE\"] =~ /source.(obj)?c(\\+\\+)?/\n\n  res = IO.popen(COMPILER[scope]) { |io| io.read }\n  if res =~ /\#{USR_HEAD}(.*)\#{SYS_HEAD}(.*)\#{FOOTER}/m\n\tcase domain\n\t  when :system  then $2\n\t  when :user    then $1 + \" .\\n\"\n\t  when :all     then $1 + \" .\\n\" + $2\n\tend.scan(/ (\\S*)(?: \\(framework directory\\)$)?/).flatten\n  else\n\tabort \"Failed to parse compiler output.\\nCommand: \" + COMPILER[scope]\n  end\nend\n\ndef user_search_path(domain = :system)\n  usr = ENV[\"TM_USR_HEADER_PATH\"].to_s\n  sys = ENV[\"TM_SYS_HEADER_PATH\"].to_s\n\n  res = case domain\n\twhen :system  then sys\n\twhen :user    then usr\n\twhen :all     then \"\#{usr}:\#{sys}\"\n  end.split(\":\")\n  res.delete(\"\")\n\n  res.empty? ? nil : res\nend\n\ndef expand_dirs(entries)\n\tentries.map do |entry|\n\t\tif entry =~ /(.*)\\.framework$/\n\t\t\tif File.exists? \"\#$1.framework/Headers/\#$1.h\"\n\t\t\t\t\"\#$1/\#$1.h\"\n\t\t\telsif File.exists? \"\#$1.framework/Headers\"\n\t\t\t\tDir[\"\#$1.framework/Headers/[A-Za-z]*.h\"].sort.map do |e|\n\t\t\t\t\te.sub(/\\.framework\\/Headers\\//, \"/\")\n\t\t\t\tend\n\t\t\telse\n\t\t\t\t[ ]\n\t\t\tend\n\t\telsif File.directory? entry\n\t\t\tDir[entry + \"/[A-Za-z]*.h\"].sort\n\t\telse\n\t\t\tentry\n\t\tend\n\tend\nend\n\npartial_word = ENV[\"TM_CURRENT_WORD\"]\n\ndirs = user_search_path(:system) || compiler_search_path(:system)\nres = [ ] \ndirs.each do |dir|\n\tDir.chdir(dir) { res << expand_dirs(Dir[partial_word + \"*\"].sort) }\nend\nputs res.flatten.join(\"\\n\")",
    disableDefaultCompletion: 1},
  uuid: "9136716A-CE06-4801-ABC9-3D64300869F8"},
 {name: "Header Completion (User)",
  scope: "meta.preprocessor.c.include string.quoted.double",
  settings: 
   {completionCommand: 
     "find \"$TM_DIRECTORY\" -name \"$TM_CURRENT_WORD*.h\" -maxdepth 2 -exec basename \"{}\" \\;|sort",
    disableDefaultCompletion: 1},
  uuid: "66EE7D45-6AA0-4AB9-9699-A3DF4E2B9AE7"},
 {name: "Indentation Rules",
  scope: "source.c, source.c++, source.objc, source.objc++",
  settings: 
   {decreaseIndentPattern: 
     "(?x)\n\t    ^ (.*\\*/)? \\s* \\} ( [^}{\"']* \\{ | \\s* while \\s* \\( .* )? [;\\s]* (//.*|/\\*.*\\*/\\s*)? $\n\t|   ^ \\s* (public|private|protected): \\s* $\n\t|   ^ \\s* @(public|private|protected) \\s* $\n\t",
    increaseIndentPattern: 
     "(?x)\n\t    ^ .* \\{ [^}\"']* $\n\t|   ^ \\s* (public|private|protected): \\s* $\n\t|   ^ \\s* @(public|private|protected) \\s* $\n\t",
    indentNextLinePattern: 
     "(?x)^\n\t    (?! .* [;:{}]                   # do not indent when line ends with ;, :, {, or }\n\t        \\s* (//|/[*] .* [*]/ \\s* $) #  …account for potential trailing comment\n\t    |   @(public|private|protected) # do not indent after obj-c data access keywords\n\t    )\n\t    .* [^\\s;:{}] \\s* $              # indent next if this one isn’t\n\t                                    #  terminated with ;, :, {, or }\n\t",
    unIndentedLinePattern: 
     "^\\s*((/\\*|\\*/|//|#|template\\b.*?>(?!\\(.*\\))|@protocol|@optional|@interface(?!.*\\{)|@implementation|@end).*)?$"},
  uuid: "02EB44C6-9203-4F4C-BFCB-7E3360B12812"},
 {name: "Indentation Rules (Comments)",
  scope: "comment.block",
  settings: 
   {decreaseIndentPattern: "(?=not)possible",
    increaseIndentPattern: "(?=not)possible",
    indentNextLinePattern: "(?=not)possible",
    unIndentedLinePattern: "(?=not)possible"},
  uuid: "56BF3367-130A-4AA1-A136-755CB3702503"},
 {name: "Spell Checking: Disable for Include Strings",
  scope: "meta.preprocessor.c.include string.quoted",
  settings: {spellChecking: 0},
  uuid: "DC32505E-226B-409A-B3C3-8FC88BF4A131"},
 {bundleUUID: "4675A940-6227-11D9-BFB1-000D93589AF6",
  name: "Symbol List: Indent Class Methods",
  scope: "meta.class-struct-block.c++ entity.name.function",
  settings: {symbolTransformation: "\n      s/^\\s*/ /;  # pad"},
  uuid: "B2B97E23-E686-4410-991D-A92AF3A9FC95"},
 {name: "Symbol List: Prefix Banner Items",
  scope: "meta.toc-list.banner",
  settings: {symbolTransformation: "\n   s/^\\s+/# /;\n   s/^=+$/-/;\n   "},
  uuid: "A8E4E48A-81F3-4DB7-A7A2-88662C06E011"},
 {name: "Typing Pairs: Include Statements",
  scope: "meta.preprocessor.c.include",
  settings: 
   {highlightPairs: [["\"", "\""], ["<", ">"]],
    smartTypingPairs: [["\"", "\""], ["<", ">"]]},
  uuid: "1EACF554-A30C-44B0-B97A-11E3FA995045"},
 {name: "Typing Pairs: Template/Cast",
  scope: "storage.type.c++.template, keyword.operator.c++.cast",
  settings: {highlightPairs: [["<", ">"]], smartTypingPairs: [["<", ">"]]},
  uuid: "47DD44E6-B4F5-4C2E-BC62-C6ACEBC02A0D"}]
