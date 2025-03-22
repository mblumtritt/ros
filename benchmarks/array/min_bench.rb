# frozen_string_literal: true

require 'date'
require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:min - find the lowest element of an Array' do
  array = (Date.new(2012)..Date.new(2012)).to_a.shuffle!.freeze

  code '#min' do
    array.min
  end

  code '#sort[0]' do
    array.sort[0]
  end
end
