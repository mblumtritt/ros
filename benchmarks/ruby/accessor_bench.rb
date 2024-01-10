# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Ruby:accessor - access object member' do
  sample =
    Class
      .new do
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

        def foo
          @foo
        end

        def foo=(value)
          @foo = value
        end
      end
      .new

  code 'accessor' do
    sample.bar = sample.bar
  end

  code 'getter/setter' do
    sample.baz = sample.baz
  end

  code 'getter/setter*' do
    sample.foo = sample.foo
  end
end
