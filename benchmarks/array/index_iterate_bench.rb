# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:index_iterate - iterate all elements' do
  array = (0..999).to_a.freeze

  code '#each_with_index' do
    ret = 0
    array.each_with_index { |element, index| ret += element + index }
    ret
  end

  code '#each' do
    ret = index = 0
    array.each do |element|
      ret += element + index
      index += 1
    end
    ret
  end

  code '#[]' do
    ret = 0
    array.size.times { |index| ret += array[index] + index }
    ret
  end
end
