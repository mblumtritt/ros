# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Struct:create_cmp - create a Struct/Data/Hash' do
  has_different_object_results!

  sample = Struct.new(:a, :b, :c, :d)
  data_sample = Data.define(:a, :b, :c, :d)

  code 'Struct.new', -> { sample.new(1, 2, 3, 4) }
  code 'Struct.new2', -> { sample.new(a: 1, b: 2, c: 3, d: 4) }
  code 'Data.new', -> { data_sample.new(1, 2, 3, 4) }
  code 'Data.new2', -> { data_sample.new(a: 1, b: 2, c: 3, d: 4) }
  code 'Hash.new', -> { { a: 1, b: 2, c: 3, d: 4 } }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
