# frozen_string_literal: true

return unless defined?(Data)

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Struct:create - create a Struct/Data/Hash' do
  has_different_object_results!

  sample = Struct.new(:a, :b, :c, :d)
  data_sample = Data.define(:a, :b, :c, :d)

  code 'Struct.new' do
    sample.new(1, 2, 3, 4)
  end

  code 'Struct.new2' do
    sample.new(a: 1, b: 2, c: 3, d: 4)
  end

  code 'Data.new' do
    data_sample.new(1, 2, 3, 4)
  end

  code 'Data.new2' do
    data_sample.new(a: 1, b: 2, c: 3, d: 4)
  end

  code 'Hash.new' do
    { a: 1, b: 2, c: 3, d: 4 }
  end
end

RubyOnSpeed.report! __FILE__
