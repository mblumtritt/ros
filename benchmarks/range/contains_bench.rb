# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'
require 'date'

RubyOnSpeed.test 'Range: contains element' do
  sample_range = (Date.new(2000)..Date.new(2001)).freeze
  sample = (sample_range.last - 42).freeze

  code '#cover?',   ->{ sample_range.cover?(sample) }
  code 'compare',   ->{ sample_range.first <= sample && sample <= sample_range.last }
  code '#member?',  ->{ sample_range.member?(sample) }
  code '#include?', ->{ sample_range.include?(sample) }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
