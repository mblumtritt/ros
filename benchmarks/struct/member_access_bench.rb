# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Struct member access' do
  struct = Struct.new(:a, :b, :c, :d).new

  code '#method' do
    struct.a = struct.b = 1
    struct.a += struct.b
  end

  code '#[]' do
    struct[:a] = struct[:b] = 1
    struct[:a] += struct[:b]
  end
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
