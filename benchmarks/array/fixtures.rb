# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.fixtures(
  integers: Array.new(1000, &:itself),
  objects: Array.new(1000) { Object.new }
)
