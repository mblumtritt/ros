# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Integer:min_max - find min and max' do
  def minmax(a, b)
    [a, b].minmax
  end

  def compare(a, b)
    a, b = b, a if b < a
    [a, b]
  end

  def compare2(a, b)
    b < a ? [b, a] : [a, b]
  end

  code 'compare2' do
    compare2(21, 42) << compare2(42, 21)
  end

  code 'compare' do
    compare(21, 42) << compare(42, 21)
  end

  code 'inline#minmax' do
    [21, 42].minmax << [42, 21].minmax
  end

  code 'Array#minmax' do
    minmax(21, 42) << minmax(42, 21)
  end
end
