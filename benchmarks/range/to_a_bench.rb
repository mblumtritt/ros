# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Range:to_a - convert a Range to an Array' do
  range = (1..10_000)

  code '#to_a' do
    range.to_a
  end

  code '[*range]' do
    [*range]
  end
end
