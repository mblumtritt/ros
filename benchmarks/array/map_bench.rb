# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:map - modify all elements of an Array' do
  array = (0..999).to_a.freeze

  code '#map' do
    Array.new(array).map(&:to_s)
  end

  code '#map!' do
    Array.new(array).map!(&:to_s)
  end
end
