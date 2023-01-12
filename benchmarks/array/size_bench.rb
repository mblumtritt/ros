# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array:size - get the count of Array entries ' do
  sample_array = Array.new(1000).freeze

  code '#size' do
    sample_array.size
  end

  code '#count' do
    sample_array.count
  end

  code '#length' do
    sample_array.length
  end
end

RubyOnSpeed.report! __FILE__
