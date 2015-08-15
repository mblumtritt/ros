require 'date'
require_relative '../lib/ruby_on_speed'

SAMPLE_RANGE = (Date.new(2000)..Date.new(2000, 12, 31))

RubyOnSpeed.check do
  code 'Range#to_a', ->{ SAMPLE_RANGE.to_a }
  code '[*Range]',   ->{ [*SAMPLE_RANGE] }
end

RubyOnSpeed.check do
  DATE = SAMPLE_RANGE.last - 42
  code 'Range#include?', ->{ SAMPLE_RANGE.include?(DATE) }
  code 'Range#cover?',   ->{ SAMPLE_RANGE.cover?(DATE) }
end
