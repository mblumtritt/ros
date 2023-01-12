# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby:assign - variable assignment' do
  code 'sequential_assignment' do
    x = 42
    a = 1
    b = 2
    c = 3
    d = 4
    e = 5
    f = 6
    g = 7
    h = 8
    i = 9
    j = x
    a + b + c + d + e + f + g + h + i + j + x
  end

  code 'parallel_assignment' do
    x = 42
    a, b, c, d, e, f, g, h, i, j = 1, 2, 3, 4, 5, 6, 7, 8, 9, x
    a + b + c + d + e + f + g + h + i + j + x
  end
end

RubyOnSpeed.report! __FILE__
