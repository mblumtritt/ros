# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Float:square - calculate the square of a Float' do
  sample = 113.11

  code 'x**2' do
    sample**2
  end

  code 'x * x' do
    sample * sample
  end
end

RubyOnSpeed.report! __FILE__
