# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array:index_iterate - ' \
                   'iterate over all elements of an Array' do
  sample_array = fixture(:integers)

  code '#each_with_index' do
    ret = 0
    sample_array.each_with_index { |element, index| ret += element + index }
    ret
  end

  code '#each' do
    ret = index = 0
    sample_array.each do |element|
      ret += element + index
      index += 1
    end
    ret
  end

  code '#[]' do
    ret = 0
    sample_array.size.times { |index| ret += sample_array[index] + index }
    ret
  end
end

RubyOnSpeed.report! __FILE__
