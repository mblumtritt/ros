# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby: loop vs. while' do
  code 'loop' do
    x = 0
    loop do
      x += 1
      break if x == 10
    end
    x
  end

  code 'while' do
    x = 0
    x += 1 while x < 10
    x
  end

  code 'until' do
    x = 0
    x += 1 until x == 10
    x
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
