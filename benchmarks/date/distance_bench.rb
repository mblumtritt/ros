# frozen_string_literal: true

require 'date'
require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Date:distance - calculate number of days between two dates' do
  date_1 = Date.new(2020, 1, 1)
  date_2 = Date.new(2020, 1, 31)

  code 'subtract' do
    (date_2 - date_1).to_i
  end

  code 'subtract_jd' do
    date_2.jd - date_1.jd
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
