# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby: nil access' do
  class Foo
    attr_reader :bar

    def initialize
      @bar = nil
    end
  end

  FooInstance = Foo.new

  code 'nil-test',      ->{ FooInstance.bar ? 42 + FooInstance.bar : 42}
  code '.getter', ->{ (FooInstance.bar || 0) + 42 }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
