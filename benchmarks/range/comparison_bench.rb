# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Range:comparison - is a Comparable in a Range' do
  require('date')

  start_value = Time.utc(2020)
  end_value = Time.utc(2020, 1, 2, 3, 4, 5)

  range = (start_value..end_value)
  sample = range.begin + 86_400

  code '#between?' do
    sample.between?(start_value, end_value)
  end

  code '#cover?' do
    range.cover?(sample)
  end

  code '#include?' do
    range.include?(sample)
  end

  code '#member?' do
    range.member?(sample)
  end

  code 'explicite #<=' do
    start_value <= sample && sample <= end_value
  end
end
