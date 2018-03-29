require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Struct vs. Hash: access' do
  struct = Struct.new(:a, :b, :c, :d).new
  hash = {a: nil, b: nil, c: nil, d: nil}

  code 'struct#' do
    struct.a = struct.b = 1
    struct.c, struct.d = struct.a, struct.b
    struct.a += struct.b
  end

  code 'hash#' do
    hash[:a] = hash[:b] = 1
    hash[:c], hash[:d] = hash[:a], hash[:b]
    hash[:a] += hash[:b]
  end
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
