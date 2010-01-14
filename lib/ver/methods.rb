require 'ver/methods/bookmark'
require 'ver/methods/clipboard'
require 'ver/methods/completion'
require 'ver/methods/control'
require 'ver/methods/ctags'
require 'ver/methods/delete'
require 'ver/methods/help'
require 'ver/methods/insert'
require 'ver/methods/move'
require 'ver/methods/open'
require 'ver/methods/preview'
require 'ver/methods/save'
require 'ver/methods/search'
require 'ver/methods/select'
require 'ver/methods/undo'
require 'ver/methods/views'
require 'ver/methods/snippet'
require 'ver/methods/autofill'
require 'ver/methods/shortcuts'

module VER
  module Methods
    include(Completion, Control, Ctags, Delete, Help, Insert, Move, Open,
            Preview, Save, Search, Select, Clipboard, Bookmarks::Methods,
            Views, Undo, AutoFill, Snippet)
    include Shortcuts
  end
end
