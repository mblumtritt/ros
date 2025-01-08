# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:fill - create an Array with Integers' do
  code '.new' do
    Array.new(100, &:itself)
  end

  code '#times#to_a' do
    100.times.to_a
  end

  code '#fill' do
    [].fill(0, 100, &:itself)
  end
end
