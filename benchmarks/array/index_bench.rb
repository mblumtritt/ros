# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:index - find the index of an Array element' do
  sample_array = fixture(:objects)
  sample = sample_array.sample

  code '#index(obj)' do
    sample_array.index(sample)
  end

  code '#find_index(obj)' do
    sample_array.find_index(sample)
  end

  code '#index(&bl)' do
    sample_array.index { |i| i == sample }
  end

  code '#find_index(&bl)' do
    sample_array.find_index { |i| i == sample }
  end
end

RubyOnSpeed.report! __FILE__
