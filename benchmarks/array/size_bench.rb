# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:size - get the count of Array entries ' do
  sample = fixture(:integers)

  code '#size' do
    sample.size
  end

  code '#count' do
    sample.count
  end

  code '#length' do
    sample.length
  end
end
