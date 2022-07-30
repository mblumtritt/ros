# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Float:square - calculate the square of a Float' do
  sample = 113.11

  code 'x**2', -> { sample**2 }
  code 'x * x', -> { sample * sample }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
