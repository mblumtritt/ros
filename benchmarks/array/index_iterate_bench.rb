# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:index_iterate - iterate all elements' do
  sample = fixture(:integers)

  code '#each_with_index' do
    ret = 0
    sample.each_with_index { |element, index| ret += element + index }
    ret
  end

  code '#each' do
    ret = index = 0
    sample.each do |element|
      ret += element + index
      index += 1
    end
    ret
  end

  code '#[]' do
    ret = 0
    sample.size.times { |index| ret += sample[index] + index }
    ret
  end
end
