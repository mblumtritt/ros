# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark(
  'Date:distance - calculate number of days between two dates'
) do
  require('date')

  start_date = Date.new(2020)
  end_date = start_date + 111

  code '#-' do
    end_date - start_date
  end

  code '#jd#-' do
    end_date.jd - start_date.jd
  end
end
