# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.add_fixture(:integers) { Array.new(1000, &:itself).shuffle! }

RubyOnSpeed.add_fixture(:integers_subset) do
  Array.new(100) { |i| i + 399 }.shuffle!
end

RubyOnSpeed.add_fixture(:objects) { Array.new(255) { Object.new } }

RubyOnSpeed.add_fixture(:sorted_dates) do
  require 'date'
  (Date.new(2000)..Date.new(2012)).to_a
end

RubyOnSpeed.add_fixture(:dates) { RubyOnSpeed.fixture(:sorted_dates).shuffle }
