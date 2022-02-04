# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby: nil access' do
  class NilAccessFoo
    attr_reader :bar

    def initialize
      @bar = nil
    end
  end

  nil_access_foo = NilAccessFoo.new

  code 'nil-test', -> { nil_access_foo.bar ? 42 + nil_access_foo.bar : 42 }
  code '.getter', -> { (nil_access_foo.bar || 0) + 42 }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
