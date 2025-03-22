# frozen_string_literal: true

return unless defined?(Data.define)

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Struct:read_member - read member Struct/Data/Hash' do
  struct_sample = Struct.new(:a, :b, :c, :d)[1, 2, 3, 4].freeze
  data_sample = Data.define(:a, :b, :c, :d)[1, 2, 3, 4]
  hash_sample = { a: 1, b: 2, c: 3, d: 4 }.freeze

  code 'Struct#' do
    [struct_sample.d, struct_sample.c, struct_sample.a, struct_sample.b]
  end

  code 'Data#' do
    [data_sample.d, data_sample.c, data_sample.a, data_sample.b]
  end

  code 'Hash#' do
    [hash_sample[:d], hash_sample[:c], hash_sample[:a], hash_sample[:b]]
  end
end
