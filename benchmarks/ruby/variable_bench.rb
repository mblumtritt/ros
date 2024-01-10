# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Ruby:variable - access a value' do
  sample =
    Class
      .new do
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

        def use_reader
          var + var
        end
      end
      .new

  code '@var' do
    sample.use_var
  end

  code '#const' do
    sample.use_const
  end

  code '#reader' do
    sample.use_reader
  end
end
