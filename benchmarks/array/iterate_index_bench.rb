# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array: iterate with index' do
  sample_array = Array.new(1000, &:itself)

  code '#each_with_index' do
    ret = 0
    sample_array.each_with_index{ |element, index| ret += element + index }
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
    sample_array.size.times do |index|
      ret += sample_array[index] + index
    end
    ret
  end
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
