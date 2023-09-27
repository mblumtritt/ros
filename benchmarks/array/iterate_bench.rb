# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:iterate - iterate over all Array elements' do
  sample_array = fixture(:integers)

  code '#each' do
    sum = 0
    sample_array.each { |element| sum += element }
    sum
  end

  code '#[]' do
    sum = 0
    sample_array.size.times { |index| sum += sample_array[index] }
    sum
  end
end

RubyOnSpeed.report! __FILE__
