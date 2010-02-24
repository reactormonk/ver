module VER
  class Buffer
    class Frame < Tk::Frame
      attr_reader :buffer
      attr_accessor :shown
      alias shown? shown

      def initialize(parent, buffer, options = {})
        @buffer = buffer
        options = options.dup
        # options[:style] ||= VER.obtain_style_name('Buffer', 'TFrame')
        # options[:padding] ||= 2
        # options[:relief] ||= :solid
        super(parent, options)

        @shown = true

        bind('<Destroy>'){ destroy; Tk.callback_break }
        bind('<FocusIn>'){ buffer.focus }
      end

      def style
        style = cget(:style)
        style.first if style
      end

      def destroy
        style_name = style
        super
      ensure
        VER.return_style_name(style_name)
      end
    end
  end
end