# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Object: class check' do
  Foo = Class.new
  instance = Class.new(Foo).new

  code 'is_a?', -> { instance.is_a?(Foo) }
  code 'kind_of?', -> { instance.kind_of?(Foo) }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
