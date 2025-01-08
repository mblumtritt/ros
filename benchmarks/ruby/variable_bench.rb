# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Ruby:variable - access a value' do
  sample_class =
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

      def use_real_const
        self.class::CONST + self.class::CONST
      end

      def use_reader
        var + var
      end
    end

  sample_class::CONST = 21
  sample = sample_class.new

  code '#use_var' do
    sample.use_var
  end

  code '#use_const' do
    sample.use_const
  end

  code '#use_real_const' do
    sample.use_real_const
  end

  code '#use_reader' do
    sample.use_reader
  end
end
