# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby: nil access' do
  class NilAccessFoo
    attr_reader :bar

    def initialize
      @bar = nil
    end
  end

  NilAccessFooInstance = NilAccessFoo.new

  code 'nil-test', ->{ NilAccessFooInstance.bar ? 42 + FooInstance.bar : 42}
  code '.getter',  ->{ (NilAccessFooInstance.bar || 0) + 42 }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
