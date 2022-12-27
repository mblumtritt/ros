# frozen_string_literal: true

require 'date'
require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Date:distance - calculate number of days between two dates' do
  sample_1 = Date.new(2020, 1, 1)
  sample_2 = Date.new(2020, 1, 31)

  code 'subtract' do
    (sample_2 - sample_1).to_i
  end

  code 'subtract_jd' do
    sample_2.jd - sample_1.jd
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
