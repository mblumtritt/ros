# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby: getter/setter vs. accessor' do
  class GetterSetterFoo
    attr_accessor :bar

    def initialize
      @bar = @baz = @foo = 1
    end

    def baz
      @baz
    end

    def baz=(value)
      @baz = value
    end

    def foo = @foo

    def foo=(value)
      @foo = value
    end
  end

  getter_setter_foo = GetterSetterFoo.new

  code 'accessor' do
    getter_setter_foo.bar = getter_setter_foo.bar
  end

  code 'getter/setter' do
    getter_setter_foo.baz = getter_setter_foo.baz
  end

  code 'endl getter/setter' do
    getter_setter_foo.foo = getter_setter_foo.foo
  end
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
