module VER
  minor_mode :help do
    handler Methods::Help

    map :describe_key, %w[Control-h k]
  end

  minor_mode :open do
    handler Methods::Open
    map :file_open_ask, %w[Control-x Control-f]
  end

  minor_mode :save do
    map :save,     %w[Control-x Control-s]
    # map :save_as,  %w[Control-S], %w[colon w space]
    # map :save_all, %w[colon w a]
  end

  minor_mode :basic do
    inherits :help, :save, :open

    handler Methods::Basic
    map :minibuf_eval,    %w[Alt-x], %w[Control-x Control-m]
    map :open_terminal,   %w[F9]
    map :open_console,    %w[Control-exclam] if defined?(::EM)
    map :quit,            %w[Control-x Control-c]
  end

  minor_mode :undo do
    handler Methods::Undo

    map :undo, %w[Control-slash], %w[Control-x u], %w[Control-underscore]
    # map :redo, %w[Redo] # emacs redo breaks my brain... undo only for now
  end

  minor_mode :clipboard do
    handler Methods::Clipboard
    map :paste, %w[Control-y]
  end

  minor_mode :delete do
    handler :at_insert
    map [:killing, :prev_char],     %w[BackSpace]
    map [:killing, :next_char],     %w[Control-d], %w[Delete]
    map :kill_line,                 %w[Control-k]
    # map [:killing, :end_of_sentence], %w[Alt-k]
    map [:killing, :next_word],       %w[Alt-d]
    map [:killing, :prev_word],       %w[Alt-BackSpace]
  end

  minor_mode :move do
    handler Methods::Move

    handler :at_insert
    map :end_of_buffer,     %w[Alt-greater]
    map :end_of_line,     %w[Control-e], %w[End]
    map :next_char,       %w[Control-f], %w[Right]
    map :next_line,       %w[Control-n], %w[Down]
    map :next_page,       %w[Control-v], %w[Next]
    map :next_word,       %w[Alt-f]
    map :prev_char,       %w[Control-b], %w[Left]
    map :prev_line,       %w[Control-p], %w[Up]
    map :prev_page,       %w[Alt-v],     %w[Prior]
    map :prev_word,       %w[Alt-b]
    map :go_line,         %w[Alt-less]
    map :start_of_line,   %w[Control-a], %w[Home]
    map :end_of_sentence, %w[Alt-e]
  end

  minor_mode :control do
    inherits :basic, :move, :insert, :delete, :undo, :search, :clipboard

    become :select_char, %w[Control-space]

    handler :at_insert
    map :insert_newline, %w[Return]

    handler Methods::Control
    # In Emacs, C-l cycles the position of line from center to bottom to top
    map :cursor_vertical_center,   %w[Control-l]

    map :executor, %w[colon colon]
    map [:ex, :buffer],       %w[colon b u], %w[Control-x b], %w[Control-m b]
    map [:ex, :edit],         %w[colon e space]
    map [:ex, :encoding],     %w[colon e n space]
    map [:ex, :fuzzy],        %w[colon f], %w[Control-semicolon]
    map [:ex, :grep],         %w[colon g]
    map [:ex, :grep_buffers], %w[colon G]
    map [:ex, :locate],       %w[colon l]
    map [:ex, :method],       %w[colon m]
    map [:ex, :open],         %w[colon o Return]
    map [:ex, :syntax],       %w[colon s]
    map [:ex, :theme],        %w[colon t]
    # map [:ex, :write],        %w[colon w]

    map :toggle_case, %w[asciitilde]
    # map :wrap_line, %w[g w]
    # map :indent_line,                       %w[greater]
    # map :unindent_line,                     %w[less]
    # map :join_line_forward,                 %w[J]
    map :open_file_under_cursor,            %w[g f]
    # map :smart_evaluate,                    %w[Alt-e], %w[Control-m e]

    handler Methods::SearchAndReplace
    map :query, %w[Alt-percent]
  end

  minor_mode :select do
    inherits :basic, :move, :search

    handler :at_sel
    map :comment,         %w[comma c]
    map :copy,            %w[Alt-w]
    # map :indent,          %w[greater]
    map :kill,            %w[Control-w]
    # map :lower_case,      %w[u]
    # map :replace_string,  %w[c]
    # map :toggle_case,     %w[asciitilde]
    # map :upper_case,      %w[U]
    # map :uncomment,       %w[comma u]
    # map :unindent,        %w[less]

    # handler Methods::Control
    # map :smart_evaluate,  %w[Alt-e], %w[Control-e]

    handler Methods::Selection
    map :pipe,            %w[exclam]
  end

  minor_mode :select_char do
    inherits :select

    become :control,             %w[Control-g], %w[Escape]
    # become :select_replace_char, %w[r]

    handler :at_sel
    enter :enter
    leave :leave
    # map :wrap, %w[g w]
  end

  minor_mode :search_and_replace do
    become :control, %w[Control-g], %w[Escape]

    handler Methods::SearchAndReplace
    enter :enter
    leave :leave

    map :replace_all,  %w[a], %w[exclam]
    map :replace_once, %w[y]
    map :next,         %w[n], %w[s], %w[j], %w[Control-n]
    map :prev,         %w[k], %w[Control-p]
  end

  major_mode :Fundamental do
    use :control
  end

  minor_mode :readline do
    map :accept_line,       %w[Return]

    map :end_of_line,       %w[End], %w[Control-e]
    map :insert_selection,  %w[Shift-Insert]
    map :insert_tab,        %w[Control-v Tab], %w[Control-i]
    map :kill_end_of_line,  %w[Control-k]
    map :kill_next_char,    %w[Control-d], %w[Delete]
    map :kill_next_word,    %w[Alt-d]
    map :kill_prev_char,    %w[BackSpace]
    map :kill_prev_word,    %w[Control-w]
    map :next_char,         %w[Right], %w[Control-f]
    map :next_word,         %w[Shift-Right], %w[Alt-f]
    map :prev_char,         %w[Left], %w[Control-b]
    map :prev_word,         %w[Shift-Left], %w[Alt-b]
    map :start_of_line,     %w[Home], %w[Control-a]
    map :transpose_chars,   %w[Control-t]

    # TODO
    map :sel_prev_char,     %w[Shift-Left]
    map :sel_next_char,     %w[Shift-Right]
    map :sel_prev_word,     %w[Shift-Control-Left]
    map :sel_next_word,     %w[Shift-Control-Right]
    map :sel_start_of_line, %w[Shift-Home]
    map :sel_end_of_line,   %w[Shift-End]

    missing :insert_string
  end

  major_mode :MiniBuffer do
    use :readline

    map :abort,           %w[Escape], %w[Control-c]
    map :attempt,         %w[Return]
    map :complete_large,  %w[Double-Tab]
    map :complete_small,  %w[Tab]
    map :next_history,    %w[Down]
    map :prev_history,    %w[Up]
  end

  major_mode :Completions do
    handler MiniBuffer
    map :answer_from, %w[Button-1]
  end

  major_mode :Executor do
    use :executor_label
  end

  minor_mode :executor_entry do
    inherits :readline

    map :completion, %w[Tab]
    map :cancel,     %w[Escape]
    map :next_line,  %w[Down], %w[Control-j], %w[Control-n]
    map :prev_line,  %w[Up], %w[Control-k], %w[Control-p]
  end

  minor_mode :executor_label do
    inherits :executor_entry

    map :speed_selection,  %w[space]

    missing :insert_string
  end
end
