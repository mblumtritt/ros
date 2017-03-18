require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Ruby: assign' do
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
    nil
  end

  code 'parallel_assignment' do
    x = 42
    a, b, c, d, e, f, g, h, i, j = 1, 2, 3, 4, 5, 6, 7, 8, 9, x
    nil
  end
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
