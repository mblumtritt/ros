# frozen_string_literal: true

require 'date'
require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.fixtures(
  integers: Array.new(1000, &:itself).shuffle!,
  integers_subset: Array.new(100) { |i| i + 399 }.shuffle!,
  objects: Array.new(500) { Object.new },
  sorted_dates: (Date.new(2000)..Date.new(2015)).to_a
)
RubyOnSpeed.fixtures(dates: RubyOnSpeed.fixture(:sorted_dates).shuffle)
