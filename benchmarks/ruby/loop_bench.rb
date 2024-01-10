# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Ruby:loop - different loops' do
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
    while x < 10
      # we prevent one-liners
      x += 1
    end
    x
  end

  code 'until' do
    x = 0
    until x == 10
      # we prevent one-liners
      x += 1
    end
    x
  end
end
