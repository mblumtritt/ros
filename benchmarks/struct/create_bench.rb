# frozen_string_literal: true

return unless defined?(Data.define)

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Struct:create - create a Struct/Data/Hash' do
  test_with { _1.to_h == { a: 1, b: 2, c: 3, d: 4 } }

  sample = Struct.new(:a, :b, :c, :d)
  data_sample = Data.define(:a, :b, :c, :d)

  code 'Struct.new(*)' do
    sample.new(1, 2, 3, 4)
  end

  code 'Struct.new(**)' do
    sample.new(a: 1, b: 2, c: 3, d: 4)
  end

  code 'Struct[*]' do
    sample[1, 2, 3, 4]
  end

  code 'Struct[**]' do
    sample[a: 1, b: 2, c: 3, d: 4]
  end

  code 'Data.new(*)' do
    data_sample.new(1, 2, 3, 4)
  end

  code 'Data.new(**)' do
    data_sample.new(a: 1, b: 2, c: 3, d: 4)
  end

  code 'Data[*]' do
    data_sample[1, 2, 3, 4]
  end

  code 'Data[**]' do
    data_sample[1, 2, 3, 4]
  end

  code '{**}' do
    { a: 1, b: 2, c: 3, d: 4 }
  end
end
