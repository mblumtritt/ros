# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Integer:min_max - find min and max' do
  def minmax(a, b)
    a, b = [a, b].minmax
    [a, b]
  end

  def compare(a, b)
    a, b = b, a if b < a
    [a, b]
  end

  code 'Array#minmax' do
    minmax(21, 42) << minmax(42, 21)
  end

  code 'compare' do
    compare(21, 42) << compare(42, 21)
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
