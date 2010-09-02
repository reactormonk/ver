module VER
  module Methods
    module SmartAutoindent
      extend self

      def newline(text)
        if text.options.autoindent
          indented_newline(text)
        else
          Insert.newline(text)
        end
      end

      def newline_below(text)
        if text.options.autoindent
          text.mark_set('insert', 'insert lineend')
          newline(text)
          text.minor_mode(:control, :insert)
        else
          Insert.newline_below(text)
        end
      end

      def newline_above(text)
        Undo.record text do |record|
          if text.index(:insert).y > 1
            Move.prev_line(text)
            newline_below(text)
          else
            record.insert('insert linestart', "\n")
            text.mark_set(:insert, 'insert - 1 line')
            Control.clean_line(text, 'insert - 1 line', record)
            text.minor_mode(:control, :insert)
          end
        end
      end

      def indented_newline(text, record = text)
        settings = indent_settings(text)
        increase, decrease = settings.values_at(:increase, :decrease)

        unless increase || decrease
          record.insert :insert, "\n"
          return
        end

        ref_line = text.get(
          "insert - 1 lines linestart",
          "insert - 1 lines lineend"
        )

        cur_line = text.get(
          "insert linestart",
          "insert"
        )

        cur_indent, next_indent = *weight_lines(ref_line, cur_line, increase, decrease)

        if text.index('insert - 1 lines') == text.index('insert')
          # first line, replace is futile
          next_indent -= 1
        elsif cur_line =~ /^\p{Space}+$/
          record.replace('insert linestart', 'insert lineend', '')
        else
          cur_indent = [0, cur_indent].max
          record.replace(
            'insert linestart',
            'insert',
            (' ' * (cur_indent * 2)) << cur_line.lstrip
          )
        end

        next_indent = [0, next_indent].max

        record.insert('insert', "\n#{' ' * (next_indent * 2)}") # TODO tabs?
      end

      # @param [String] ref_line The line we take as reference wherever we should 
      #    decrease the indentation of the previous line
      # @param [String] cur_line Current line where we want to create a newline.
      # @param [Regex] increase Regex to determine an increase pattern.
      # @param [Regex] decrease Regex to determine an decrease pattern.
      def weight_lines(ref_line, cur_line, increase, decrease)
        ref = ref_line[/^\s*/].size / 2
        ref_inc = increase ? ref_line.scan(increase).size : 0
        ref_dec = decrease ? ref_line.scan(decrease).size : 0

        cur_inc = increase ? cur_line.scan(increase).size : 0
        cur_dec = decrease ? cur_line.scan(decrease).size : 0

        # we strip whitespace from previous empty lines, but it's still added to
        # the current one, so we use it as reference.
        if ref_line.empty?
          ref = cur_line[/^\s*/].size / 2
        end

        pattern = [
          if ref_inc != 0 && ref_dec != 0; '='
          elsif ref_inc != 0; '+'
          elsif ref_dec != 0; '-'
          else; '?'
          end,
          if cur_inc != 0 && cur_dec != 0; '='
          elsif cur_inc != 0; '+'
          elsif cur_dec != 0; '-'
          else; '?'
          end
        ].join

        case pattern
        when '++'; [ref + 1, ref + 2]
        when '+-'; [ref,     ref]
        when '+='; [ref,     ref]
        when '+?'; [ref + 1, ref + 1]
        when '-+'; [ref,     ref]
        when '--'; [ref - 1, ref - 2]
        when '-='; [ref,     ref]
        when '-?'; [ref,     ref]
        when '=+'; [ref + 1, ref + 1]
        when '=-'; [ref,     ref]
        when '=='; [ref,     ref]
        when '=?'; [ref + 1, ref + 1]
        when '?+'; [ref,     ref + 1]
        when '?-'; [ref - 1, ref - 2]
        when '?='; [ref - 1, ref]
        when '??'; [ref,     ref]
        end
      end

      def indent_settings(text)
        return {} unless text.load_preferences

        indent_settings = {}

        text.preferences.each do |pref|
          settings = pref[:settings]
          indent_settings[:increase]    ||= settings[:increaseIndentPattern]
          indent_settings[:decrease]    ||= settings[:decreaseIndentPattern]
          indent_settings[:indent_next] ||= settings[:indentNextLinePattern]
          indent_settings[:unindented]  ||= settings[:unIndentedLinePattern]
        end


        [:increase, :decrease, :indent_next, :unindented].each do |key|
          if value = indent_settings[key]
            indent_settings[key] = Regexp.new(value)
          else
            indent_settings.delete(key)
          end
        end

        return indent_settings
      end
    end
  end

  case options.keymap
  when 'vim'
    minor_mode :control do
      handler Methods::SmartAutoindent
      map :newline_below, %w[o]
      map :newline_above, %w[O]
    end

    minor_mode :insert do
      handler Methods::SmartAutoindent
      map :newline, '<Return>'
    end
  end
end
