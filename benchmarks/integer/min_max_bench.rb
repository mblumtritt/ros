# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ineteger:min_max - find min and max' do
  def minmax(a, b)
    a, b = [a, b].minmax
    [a, b]
  end

  def compare(a, b)
    a, b = b, a if b < a
    [a, b]
  end

  code 'Array#minmax', -> { minmax(21, 42) << minmax(42, 21) }
  code 'compare',      -> { compare(21, 42) << compare(42, 21) }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
