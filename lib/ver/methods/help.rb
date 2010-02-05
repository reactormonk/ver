module VER
  module Methods
    module Help
      module_function

      def help_for_help
        VER::Help::HelpForHelp.new(self)
      end

      def describe_key
        VER::Help::DescribeKey.new(self)
      end
    end
  end
end
