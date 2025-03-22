# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:first - access the first element of an Array' do
  array = (0..100).to_a.freeze

  code '#[0]' do
    array[0]
  end

  code '#first' do
    array.first
  end
end
