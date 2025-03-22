# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:iterate - iterate over all Array elements' do
  array = (0..999).to_a.freeze

  code '#each' do
    sum = 0
    array.each { |element| sum += element }
    sum
  end

  code '#each_1' do
    sum = 0
    array.each { sum += _1 }
    sum
  end

  code '#[]' do
    sum = 0
    array.size.times { |index| sum += array[index] }
    sum
  end
end
