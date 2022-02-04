# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array: iterate items' do
  has_different_object_results!

  sample_array = Array.new(1000, &:itself)

  code '#each' do
    sample_array.each { |element| element + 1 }
  end

  code '#[]' do
    sample_array.size.times { |index| sample_array[index] + 1 }
  end
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
