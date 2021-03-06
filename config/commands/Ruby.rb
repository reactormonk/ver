# Encoding: UTF-8

[{beforeRunningCommand: "nop",
  command: 
   "res=$(ruby \"$TM_BUNDLE_SUPPORT/bin/make_destructive.rb\")\n\nif [ \"$res\" = \"\" ]\n  then exit_show_tool_tip \"Retry this command without a selection.\"\n  else echo -n \"$res\"\nfi",
  fallbackInput: "line",
  input: "selection",
  keyEquivalent: "^!",
  name: "Add ! to Method in Line / Selection",
  output: "insertAsSnippet",
  scope: "source.ruby",
  uuid: "7F79BC8D-8A4F-4570-973B-05DFEC25747F"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\ns = STDIN.read\ncase s\nwhen /^\\w+$/\n  print \"*\#{s}*$0\"\nwhen \"\"\n  print \"*$1*$0\"\nelse\n  print \"<b>\#{s}</b>\"\nend",
  fallbackInput: "word",
  input: "selection",
  keyEquivalent: "@b",
  name: "Bold",
  output: "insertAsSnippet",
  scope: "source.ruby comment",
  uuid: "931DD73E-615E-476E-9B0D-8341023AE730"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby -w\n\nrequire \"\#{ENV[\"TM_SUPPORT_PATH\"]}/lib/exit_codes\"\nrequire \"\#{ENV[\"TM_SUPPORT_PATH\"]}/lib/ui\"\n\nrequire \"pathname\"\n\nTM_RUBY    = ENV[\"TM_RUBY\"] || \"ruby\"\nRCODETOOLS = \"\#{ENV['TM_BUNDLE_SUPPORT']}/vendor/rcodetools\"\n\nRAILS_DIR = nil\ndir = File.dirname(ENV[\"TM_FILEPATH\"]) rescue ENV[\"TM_PROJECT_DIRECTORY\"]\nif dir\n  dir = Pathname.new(dir)\n  loop do\n    if (dir + \"config/environment.rb\").exist?\n      Object.send(:remove_const, :RAILS_DIR)\n      RAILS_DIR = dir.to_s\n      break\n    end\n    \n    break if dir.to_s == \"/\"\n    \n    dir += \"..\"\n  end\nend\n\ncommand     = <<END_COMMAND.tr(\"\\n\", \" \").strip\n\"\#{TM_RUBY}\"\n-I \"\#{RCODETOOLS}/lib\"\n--\n\"\#{RCODETOOLS}/bin/rct-complete\"\n\#{\"-r \\\"\#{RAILS_DIR}/config/environment.rb\\\"\" if RAILS_DIR}\n--line=\#{ENV['TM_LINE_NUMBER']}\n--column=\#{ENV['TM_LINE_INDEX']}\n2> /dev/null\nEND_COMMAND\ncompletions = `\#{command}`.to_a.map { |l| l.strip }.select { |l| l =~ /\\S/ }\n\nif not $?.success?\n  TextMate.exit_show_tool_tip \"Parse error.\"\nelsif completions.size == 1\n  selected = completions.first\nelsif completions.size > 1\n  selected = completions[TextMate::UI.menu(completions)] rescue exit\nelse\n  TextMate.exit_show_tool_tip \"No matches were found.\"\nend\n\nprint selected.sub(/\\A\#{Regexp.escape(ENV['TM_CURRENT_WORD'].to_s)}/, \"\")\n",
  input: "document",
  keyEquivalent: "~",
  name: "Completion: Ruby (rcodetools)",
  output: "afterSelectedText",
  scope: "source.ruby",
  uuid: "47D203ED-EB9B-4653-A07B-A897800CEB76"},
 {beforeRunningCommand: "nop",
  command: "\"${TM_BUNDLE_SUPPORT}/bin/linked_ri.rb\"",
  fallbackInput: "word",
  input: "selection",
  keyEquivalent: "^h",
  name: "Documentation for Word / Selection",
  output: "showAsTooltip",
  scope: "source.ruby, source.ruby.rails",
  uuid: "63F3B3B7-CBE2-426B-B551-657733F3868B"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\n\n# be smart, dont print something if we already have..\n$write_count = 0\ndef STDOUT.write(what)\n   $write_count += 1\n   super(what)\nend\n\n# execure the code\nbegin\n  # insert a space if input was a selection, if it was a line insert \\n\n  print(ENV['TM_SELECTED_TEXT'] ? \" \" : \"\\n\")\n  r = eval(STDIN.read)\nrescue Object\n  r = $!.class.to_s\nend\n\n# try to_s, if it doesnt work use inspect\n# Array and Hash are shown via inspect because they look better with formating\n# do this just if the script did not print anything itself\nif $write_count == 1\n  print( (r.class != Hash and r.class != Array and not r.nil? and r.respond_to? :to_s) ? r.to_s : r.inspect )\n  print( \"\\n\" ) unless ENV.has_key?('TM_SELECTED_TEXT')\nend\n",
  fallbackInput: "line",
  input: "selection",
  keyEquivalent: "^E",
  name: "Execute Line / Selection as Ruby",
  output: "afterSelectedText",
  uuid: "EE5F1FB2-6C02-11D9-92BA-0011242E4184"},
 {beforeRunningCommand: "nop",
  command: 
   "export RUBYLIB=\"$TM_BUNDLE_SUPPORT/vendor/rcodetools/lib${RUBYLIB:+:$RUBYLIB}\"\nexport TM_RUBY=$(which \"${TM_RUBY:-ruby}\")\n\n\n\"${TM_RUBY}\" -r \"${TM_SUPPORT_PATH}/lib/ruby1.9/add_1.8_features.rb\" -- \"$TM_BUNDLE_SUPPORT/vendor/rcodetools/bin/xmpfilter\"\n",
  fallbackInput: "document",
  input: "selection",
  keyEquivalent: "^@E",
  name: "Execute and Update ‘# =>’ Markers",
  output: "replaceSelectedText",
  scope: "source.ruby",
  uuid: "FBFC214F-B019-4967-95D2-028F374A3221"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\n$: << \"\#{ENV['TM_SUPPORT_PATH']}/lib\"\n\nrequire \"escape\"\nrequire \"open3\"\n\n# make exceptions in the writing Thread kill the process so we don't hang\nThread.abort_on_exception = true\n\nCURSOR = [0xFFFC].pack(\"U\").freeze\nline, col = ENV[\"TM_LINE_NUMBER\"].to_i - 1, ENV[\"TM_LINE_INDEX\"].to_i\n\nstdin, stdout, stderr = Open3.popen3(\"/usr/bin/env\", \"ruby\", \"\#{ENV['TM_BUNDLE_SUPPORT']}/bin/insert_requires.rb\")\nThread.new do\n  code = STDIN.read.to_a\n  unless ENV.has_key?('TM_SELECTED_TEXT')\n    if code[line].nil?  # if cursor was on the last line and it was blank\n      code << CURSOR\n    else\n      code[line][col...col] = CURSOR\n    end\n  end\n  stdin.write code.join\n  stdin.close\nend\n\nprint stdout.read.split(CURSOR).join('${0}')\n",
  fallbackInput: "document",
  input: "selection",
  keyEquivalent: "^#",
  name: "Insert Missing Requires",
  output: "insertAsSnippet",
  scope: "source.ruby",
  uuid: "9FB64639-F776-499B-BA6F-BB45F86F80FD"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\ns = STDIN.read\ncase s\nwhen /^\\w+$/\n  print \"_\#{s}_$0\"\nwhen \"\"\n  print \"_$1_$0\"\nelse\n  print \"<em>\#{s}</em>\"\nend",
  fallbackInput: "word",
  input: "selection",
  keyEquivalent: "@i",
  name: "Italic",
  output: "insertAsSnippet",
  scope: "source.ruby comment",
  uuid: "DAA69A0C-FC1E-4509-9931-DFFB38B4D6AE"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby -wKU\n\nrequire \"\#{ENV['TM_SUPPORT_PATH']}/lib/exit_codes\"\nrequire \"\#{ENV['TM_SUPPORT_PATH']}/lib/escape\"\n\nmethod_name = ENV[\"TM_SELECTED_TEXT\"] || ENV[\"TM_CURRENT_WORD\"] or\n  TextMate.exit_show_tool_tip(\n    \"Please type the new function's name or use the def⇥ snippet.\"\n  )\n\nprint <<END_SNIPPET\ndef \#{e_sn method_name}\\${1/.+/(/}\\${1:args}\\${1/.+/)/}\n\t\\$0\nend\nEND_SNIPPET\n",
  fallbackInput: "word",
  input: "selection",
  keyEquivalent: "$\n",
  name: "New Method",
  output: "insertAsSnippet",
  scope: "source.ruby",
  uuid: "0275EF39-9357-408F-AF20-79E415CA9504"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\ns = STDIN.read\nputs \"\\#--\"\nif s== \"\"\n  puts \"\\# $0\",\"\\#++\"\nelse\n  puts s, \"\\#++\", \"$0\"\nend",
  fallbackInput: "line",
  input: "selection",
  keyEquivalent: "^@O",
  name: "Omit",
  output: "insertAsSnippet",
  scope: "source.ruby",
  uuid: "BF4CA9F1-51CD-48D4-8357-852234F59046"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\n\nrequire \"\#{ENV['TM_SUPPORT_PATH']}/lib/ui.rb\"\nrequire \"\#{ENV['TM_SUPPORT_PATH']}/lib/textmate.rb\"\n\nREQUIRE_RE = /^\\s*(?:require|load)\\s*(['\"])([^'\"#]+?)(?:\\.rb)?\\1[ \\t]*$/\n\ngems_installed = begin\n                   require 'rubygems'\n                   true\n                 rescue LoadError\n                   false\n                 end\n\nrequires = if ENV['TM_CURRENT_LINE'].to_s =~ REQUIRE_RE\n             [\"\#{$2}.rb\"]\n           else\n             $stdin.read.scan(REQUIRE_RE).map { |_, path| \"\#{path}.rb\" }\n           end\nabort 'No includes found.' if requires.empty?\n\nfile = if requires.size > 1\n         choice = TextMate::UI.menu(requires) or exit\n         requires[choice]\n       else\n         requires.pop\n       end\ndir  = $LOAD_PATH.find { |dir| File.exist? File.join(dir, file) }\nif not dir and gems_installed and gem_spec = Gem::GemPathSearcher.new.find(file)\n  dir = File.join(gem_spec.full_gem_path, gem_spec.require_path)\nend\n\nif file and dir\n  dir.sub!(%r{\\A\\.(?=/|\\z)}, ENV['TM_DIRECTORY']) if ENV['TM_DIRECTORY']\n  file_path = File.join(dir, file)\n# puts file_path\n  TextMate.go_to :file => file_path\n  exit\nelse\n  puts \"File not found: \#{file}\"\nend\n",
  fallbackInput: "document",
  input: "selection",
  keyEquivalent: "@D",
  name: "Open Require",
  output: "showAsTooltip",
  scope: "source.ruby",
  uuid: "8646378E-91F5-4771-AC7C-43FC49A93576"},
 {autoScrollOutput: true,
  beforeRunningCommand: "nop",
  command: 
   "#!/bin/sh\n\nexport RUBYLIB=\"$TM_BUNDLE_SUPPORT/RubyMate${RUBYLIB:+:$RUBYLIB}\"\n\n/usr/bin/env ruby -KU -- \"$TM_BUNDLE_SUPPORT/RubyMate/run_script.rb\"\n",
  input: "document",
  keyEquivalent: "@r",
  name: "Run",
  output: "showAsHTML",
  scope: "source.ruby",
  uuid: "35222962-C50D-4D58-A6AE-71E7AD980BE4"},
 {beforeRunningCommand: "nop",
  captureFormatString: "$0",
  capturePattern: "(/[^:]+):(\\d+)",
  command: 
   "#!/bin/sh\n\nexport RUBYLIB=\"$TM_BUNDLE_SUPPORT/RubyMate${RUBYLIB:+:$RUBYLIB}\"\n\n/usr/bin/env ruby -KU -- \"$TM_BUNDLE_SUPPORT/RubyMate/run_script.rb\" --name=\n",
  fileCaptureRegister: "1",
  input: "document",
  keyEquivalent: "@R",
  lineCaptureRegister: "2",
  name: "Run Focused Unit Test",
  output: "showAsHTML",
  scope: "source.ruby",
  uuid: "5289EE40-86B8-11D9-A8D4-000A95E13C98"},
 {beforeRunningCommand: "nop",
  command: 
   "export RUBYLIB=\"$TM_BUNDLE_SUPPORT/RakeMate${RUBYLIB:+:$RUBYLIB}\"\nexport TM_RUBY=$(which \"${TM_RUBY:-ruby}\")\nexport TM_RAKE=$(which \"${TM_RAKE:-rake}\")\n\n\"${TM_RUBY}\" -- \"$TM_BUNDLE_SUPPORT/RakeMate/rake_mate.rb\"\n",
  input: "none",
  keyEquivalent: "^R",
  name: "Run Rake Task",
  output: "showAsHTML",
  scope: "source.ruby",
  uuid: "569C9822-8C41-4907-94C7-1A8A0031B66D"},
 {beforeRunningCommand: "saveActiveFile",
  command: 
   "if (( ${#TM_PROJECT_DIRECTORY} != 0 )); then\n    cd \"$TM_PROJECT_DIRECTORY\"\n    output=\"`basename \"$TM_PROJECT_DIRECTORY\"`\"\n    input=\".\"\nelse\n    cd \"$TM_DIRECTORY\"\n    output=\"$TM_FILENAME\"\n    input=\"$TM_FILENAME\"\nfi\n\noutput_dir=\"/tmp/rdoc_${output}\"\n\nrm -rf \"${output_dir}\"\n\nrdoc -S -N -q -f html --op \"${output_dir}\" \"$input\" &>/dev/null\n\necho \"<html><head><meta http-equiv=\\\"refresh\\\" content=\\\"0;URL=tm-file://${output_dir}/index.html\\\"></head></html>\"\n",
  input: "none",
  name: "Show for Current File / Project",
  output: "showAsHTML",
  scope: "source.ruby",
  uuid: "1AD6A138-2E89-4D6A-AB3F-416BF9CE968D"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby -w\n\nrequire \"\#{ENV[\"TM_SUPPORT_PATH\"]}/lib/escape\"\nrequire \"enumerator\"\n\nTAGS = %w[<%= <%# <%- <%].freeze\n\n# locate caret (Allan's code)\nline = ENV['TM_LINE_NUMBER'].to_i - ENV['TM_INPUT_START_LINE'].to_i\ncol  = ENV['TM_LINE_INDEX'].to_i\nif ENV['TM_LINE_NUMBER'].to_i == ENV['TM_INPUT_START_LINE'].to_i\n  col -= ENV['TM_INPUT_START_LINE_INDEX'].to_i\nend\n\n# read input\ninput = $stdin.read\n\n# snippetize output\nlines       = input.to_a\nlines[line] = e_sn(lines[line][0...col]) + \"${0}\" + e_sn(lines[line][col..-1])\noutput      = lines.enum_with_index.inject(String.new) do |out, (l, i)|\n  i == line ? out + l : out + e_sn(l)\nend\n\n# swap ERb tags\nresult = output.sub(/\\A<%[-#=]?/) { |match| TAGS[TAGS.index(match) - 1] }\nif result[2] == ?-\n  result.sub!(/%>\\Z/, \"-%>\")\nelse\n  result.sub!(/-%>\\Z/, \"%>\")\nend\nprint result",
  disableOutputAutoIndent: true,
  fallbackInput: "scope",
  input: "selection",
  keyEquivalent: "^>",
  name: "Toggle ERb Tags",
  output: "insertAsSnippet",
  scope: 
   "source.ruby.embedded, source.ruby.rails.embedded, comment.block.erb, meta.erb",
  uuid: "835FAAC6-5431-436C-998B-241F7226B99B"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\n\nclass String\n  def escape(char)\n    gsub(/\\\\.|\#{Regexp.quote(char)}/) { |match| match == char ? \"\\\\\#{char}\" : match }\n  end\n\n  def unescape(char)\n    gsub(/\\\\./) { |match| match == \"\\\\\#{char}\" ? char : match }\n  end\nend\n\nprint case str = STDIN.read\n  # Handle standard quotes\n  when /\\A\"(.*)\"\\z/m;          \"'\"   + $1.unescape('\"').escape(\"'\") + \"'\"\n  when /\\A'(.*)'\\z/m;          \"%Q{\" + $1.unescape(\"'\").escape(\"}\") + \"}\"\n  when /\\A%[Qq]?\\{(.*)\\}\\z/m;  '\"'   + $1.unescape(\"}\").escape('\"') + '\"'\n\n  # Handle the more esoteric quote styles\n  when /\\A%[Qq]?\\[(.*)(\\])\\z/m,\n       /\\A%[Qq]?\\((.*)(\\))\\z/m,\n       /\\A%[Qq]?<(.*)(>)\\z/m;  '\"' + $1.unescape($2).escape('\"') + '\"'\n  when /\\A%[Qq]?(.)(.*)\\1\\z/m; '\"' + $2.unescape($1).escape('\"') + '\"'\n\n  # Handle shell escapes\n  when /\\A`(.*)`\\z/m;          \"%x{\" + $1.unescape(\"`\").escape(\"}\") + \"}\"\n  when /\\A%x\\{(.*)\\}\\z/m;      \"`\"   + $1.unescape(\"}\").escape(\"`\") + \"`\"\n\n  # Default case\n  else str\nend\n",
  fallbackInput: "scope",
  input: "selection",
  keyEquivalent: "^\"",
  name: "Toggle Quote Style",
  output: "replaceSelectedText",
  scope: 
   "source.ruby string.quoted.double, source.ruby string.quoted.single, source.ruby string",
  uuid: "6519CB08-8326-4B77-A251-54722FFBFC1F"},
 {beforeRunningCommand: "nop",
  bundleUUID: "467B298F-6227-11D9-BFB1-000D93589AF6",
  command: 
   "#!/usr/bin/env ruby\n\nprint case str = STDIN.read\n  # Handle standard quotes\n  when /\\A[\"'](\\w+)[\"']\\z/ then \":\" + $1\n  when /\\A:(\\w+)\\z/ then '\"' + $1 + '\"'\n  # Default case\n  else str\nend\n",
  fallbackInput: "scope",
  input: "selection",
  keyEquivalent: "^:",
  name: "Toggle String / Symbol",
  output: "replaceSelectedText",
  scope: "source.ruby string.quoted, source.ruby constant.other.symbol.ruby",
  uuid: "B297E4B8-A8FF-49CE-B9C4-6D4911724D43"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\ns = STDIN.read\ncase s\nwhen /^\\w+$/\n  print \"+\#{s}+$0\"\nwhen \"\"\n  print \"+$1+$0\"\nelse\n  print \"<tt>\#{s}</tt>\"\nend",
  fallbackInput: "word",
  input: "selection",
  keyEquivalent: "@k",
  name: "Typewriter",
  output: "insertAsSnippet",
  scope: "source.ruby comment",
  uuid: "2DDB6FE0-6111-4C40-A149-8E67E76F8272"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\nrequire ENV['TM_SUPPORT_PATH'] + '/lib/textmate'\nputs `\"${TM_RUBY:=ruby}\" -e'puts \"Using ruby-\" + RUBY_VERSION.to_s'`\nresult = `\"${TM_RUBY:=ruby}\" -wc 2>&1`\nputs result\nTextMate.go_to :line => $1 if result =~ /-:(\\d+):/\n",
  input: "document",
  keyEquivalent: "^V",
  name: "Validate Syntax",
  output: "showAsTooltip",
  scope: "source.ruby",
  uuid: "EE5F19BA-6C02-11D9-92BA-0011242E4184"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\nrequire ENV['TM_SUPPORT_PATH'] + '/lib/textmate'\nputs \"using ruby-\" + RUBY_VERSION.to_s + ' / erb'\nresult = `\"${TM_ERB:=erb}\" -T - -x | \"${TM_RUBY:=ruby}\" -c 2>&1`\nputs result\nTextMate.go_to :line => $1 if result =~ /-:(\\d+):/",
  input: "document",
  keyEquivalent: "^V",
  name: "Validate Syntax (ERB)",
  output: "showAsTooltip",
  scope: "text.html.ruby, text.html source.ruby",
  uuid: "76FCF165-54CB-4213-BC55-BD60B9C6A3EC"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\n$: << ENV['TM_SUPPORT_PATH'] + '/lib'\nrequire \"ui\"\nTextMate::UI.request_string(:title => \"Wrap Size\",\n                     :prompt => \"Enter a character width:\",\n                    :button1 => \"Build Snippet\") do |col|\n  col = col.to_i\n  print %Q{gsub!(/(.{1,\#{col}}|\\\\S{\#{col + 1},})(?: +|$\\\\n?)/, \"\\\\\\\\1\\\\n\")}\nend\n",
  input: "none",
  name: "word_wrap()",
  output: "afterSelectedText",
  scope: "source.ruby",
  tabTrigger: "worw",
  uuid: "97054C4D-E4A3-45B1-9C00-B82DBCB30CAD"}]
