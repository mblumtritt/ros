# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Range:to_a - convert a Range to an Array' do
  sample_range = (1..10_000).freeze

  code '#to_a' do
    sample_range.to_a
  end

  code '[*range]' do
    [*sample_range]
  end
end

RubyOnSpeed.report! __FILE__
