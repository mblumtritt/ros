# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Ruby:accessor - access object member' do
  object =
    Class
      .new do
        attr_reader :foo
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

        def foo=(value)
          @foo = value
        end
      end
      .new

  code 'accessor' do
    object.bar = object.bar
  end

  code 'getter/setter*' do
    object.foo = object.foo
  end

  code 'getter/setter' do
    object.baz = object.baz
  end
end
