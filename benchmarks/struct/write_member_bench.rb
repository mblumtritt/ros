# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Struct:write_member - write member Struct/Hash' do
  struct_sample = Struct.new(:a, :b, :c, :d)[1, 2, 3, 4]
  hash_sample = { a: 1, b: 2, c: 3, d: 4 }

  code 'Struct#' do
    struct_sample.d = 1
    struct_sample.c = 2
    struct_sample.b = 3
    struct_sample.a = 4
  end

  code 'Hash#' do
    hash_sample[:d] = 1
    hash_sample[:c] = 2
    hash_sample[:b] = 3
    hash_sample[:a] = 4
  end
end
