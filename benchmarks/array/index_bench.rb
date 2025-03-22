# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:index - find the index of an Array element' do
  array = Array.new(50) { Object.new }.freeze
  sample = array[-1]

  code '#index)' do
    array.index(sample)
  end

  code '#find_index' do
    array.find_index(sample)
  end

  code '#index{}' do
    array.index { _1 == sample }
  end

  code '#find_index{}' do
    array.find_index { _1 == sample }
  end
end
