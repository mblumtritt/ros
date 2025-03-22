# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark(
  'Array:contains - check if an Array contains an element'
) do
  test_truthy_results!

  array = Array.new(255) { Object.new }.freeze
  sample = array.sample

  code '#find_index' do
    array.find_index(sample)
  end

  code '#include?' do
    array.include?(sample)
  end

  code '#index' do
    array.index(sample)
  end
end
