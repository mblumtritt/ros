# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'
require 'date'

RubyOnSpeed.test 'Range: contains element' do
  sample_range = (Date.new(2000)..Date.new(2001)).freeze
  sample = (sample_range.last - 42).freeze

  code '#cover?' do
    sample_range.cover?(sample)
  end

  code 'compare' do
    sample_range.first <= sample && sample <= sample_range.last
  end

  code '#member?' do
    sample_range.member?(sample)
  end

  code '#include?' do
    sample_range.include?(sample)
  end
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
