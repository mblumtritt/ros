# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:last - access the last element of an Array' do
  array = (0..99).to_a.freeze

  code '#[-1]' do
    array[-1]
  end

  code '#last' do
    array.last
  end
end
