# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby:variable - access a value' do
  sample =
    Class.new do
      attr_reader :var

      def initialize
        @var = 21
      end

      def const
        21
      end

      def use_var
        @var + @var
      end

      def use_const
        const + const
      end

      def user_reader
        var + var
      end
    end.new

  code '@var', -> { sample.use_var }
  code '#const', -> { sample.use_const }
  code '#reader', -> { sample.user_reader }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
