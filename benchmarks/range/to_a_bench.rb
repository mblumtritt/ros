# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Range:to_a - convert a Range to an Array' do
  sample = (1..10_000)

  code '#to_a' do
    sample.to_a
  end

  code '[*range]' do
    [*sample]
  end
end
