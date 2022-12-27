# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby:accessor - access object member' do
  class SampleClass
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

  sample = SampleClass.new

  code 'accessor', -> { sample.bar = sample.bar }
  code 'getter/setter', -> { sample.baz = sample.baz }
  code 'getter/setter*', -> { sample.foo = sample.foo }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
