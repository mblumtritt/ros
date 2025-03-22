# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:size - get the count of Array entries ' do
  array = (0..999).to_a.freeze

  code '#size' do
    array.size
  end

  code '#length' do
    array.length
  end

  code '#count' do
    array.count
  end
end
