# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'
require 'date'

RubyOnSpeed.benchmark 'Array:fill_with - create an Array with objects' do
  code 'range#to_a' do
    (0..99).map { Date.new(_1) }
  end

  code '#fill' do
    [].fill(0, 100) { Date.new(_1) }
  end

  code '.new' do
    Array.new(100) { Date.new(_1) }
  end
end
