# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby: getter/setter vs. accessor' do
  class Foo
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

  FooInstance = Foo.new

  code 'accessor',      ->{ FooInstance.bar = FooInstance.bar }
  code 'getter/setter', ->{ FooInstance.baz = FooInstance.baz }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
