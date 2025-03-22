# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Integer:square - calculate the square of a Integer' do
  number = 113

  code 'x**2' do
    number**2
  end

  code 'x * x' do
    number * number
  end
end
