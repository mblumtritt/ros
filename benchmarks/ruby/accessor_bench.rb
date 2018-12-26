# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby: getter/setter vs. accessor' do
  class GetterSetterFoo
    attr_accessor :bar

    def initialize
      @bar = @baz = 1
    end

    def baz
      @baz
    end

    def baz=(value)
      @baz = value
    end
  end

  GetterSetterFooInstance = GetterSetterFoo.new

  code 'accessor',      ->{ GetterSetterFooInstance.bar = GetterSetterFooInstance.bar }
  code 'getter/setter', ->{ GetterSetterFooInstance.baz = GetterSetterFooInstance.baz }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
