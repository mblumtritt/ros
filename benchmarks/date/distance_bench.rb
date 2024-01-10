# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark(
  'Date:distance - calculate number of days between two dates'
) do
  require('date')

  sample1 = Date.new(2020, 1, 1)
  sample2 = Date.new(2020, 1, 31)

  code 'subtract' do
    sample2 - sample1
  end

  code 'subtract_jd' do
    sample2.jd - sample1.jd
  end
end
