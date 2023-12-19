# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:group - group Array in number of sub-arrays' do
  test_result { |result| result.map(&:size) }

  sample_array = fixture(:objects)
  sample_size = 11

  def via_hash(array, number)
    i = -1
    array.group_by { (i += 1) % number }.values
  end

  def grouping(array, number)
    division = array.size / number
    modulo = array.size % number
    start = 0
    Array.new(number) do |index|
      length = division + (modulo > 0 && modulo > index ? 1 : 0)
      slice = array.slice(start, length)
      start += length
      slice
    end
  end

  code 'via_hash' do
    via_hash(sample_array, sample_size)
  end

  code 'grouping' do
    grouping(sample_array, sample_size)
  end
end

RubyOnSpeed.report! __FILE__
