# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Float: compare zero' do
  foo = 42.21

  code '== 0', -> { foo == 0 }
  code '0 ==', -> { 0 == foo }
  code 'zero?', -> { foo.zero? }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
