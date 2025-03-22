# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:fill - create an Array with Integers' do
  code 'range#to_a' do
    (0..99).to_a
  end

  code '#fill' do
    [].fill(0, 100) { _1 }
  end

  code '#fill(:itself)' do
    [].fill(0, 100, &:itself)
  end

  code '.new' do
    Array.new(100) { _1 }
  end

  code '.new(:itself)' do
    Array.new(100, &:itself)
  end

  code '#times#to_a' do
    100.times.to_a
  end
end
