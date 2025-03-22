# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Float:square - calculate the square of a Float' do
  number = 113.11

  code 'x**2' do
    number**2
  end

  code 'x * x' do
    number * number
  end
end
