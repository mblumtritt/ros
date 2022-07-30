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

  code 'accessor' do
    sample = SampleClass.new
    sample.bar = sample.bar
  end

  code 'getter/setter' do
    sample = SampleClass.new
    sample.baz = sample.baz
  end

  code 'endl getter/setter' do
    sample = SampleClass.new
    sample.foo = sample.foo
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
