# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Struct:access_cmp - read access member Struct/Data/Hash' do
  struct = Struct.new(:a, :b, :c, :d).new(1, 2, 3, 4)
  data = Data.define(:a, :b, :c, :d).new(1, 2, 3, 4)
  hash = { a: 1, b: 2, c: 3, d: 4 }

  code 'struct#' do
    struct.a + struct.b + struct.c + struct.d
  end

  code 'data#' do
    data.a + data.b + data.c + data.d
  end

  code 'hash#' do
    hash[:a] + hash[:b] + hash[:c] + hash[:d]
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
