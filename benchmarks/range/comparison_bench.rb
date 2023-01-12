# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'
require 'date'

RubyOnSpeed.test 'Range:comparison - test if an Comparable is in a Range' do
  start_value = Time.utc(2020)
  end_value = Time.utc(2020, 1, 2, 3, 4, 5)

  range = (start_value..end_value)
  sample = start_value + 86_400

  code 'Range#cover?' do
    range.cover?(sample)
  end

  code 'Comparable#between?' do
    sample.between?(start_value, end_value)
  end

  code '#<=' do
    start_value <= sample && sample <= end_value
  end
end

RubyOnSpeed.report! __FILE__
