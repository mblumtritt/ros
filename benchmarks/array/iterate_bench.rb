# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:iterate - iterate over all Array elements' do
  sample = fixture(:integers)

  code '#each' do
    sum = 0
    sample.each { |element| sum += element }
    sum
  end

  code '#each_1' do
    sum = 0
    sample.each { sum += _1 }
    sum
  end

  code '#[]' do
    sum = 0
    sample.size.times { |index| sum += sample[index] }
    sum
  end
end
