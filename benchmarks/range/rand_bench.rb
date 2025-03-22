# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Range:rand - get a random element of a Range' do
  test_with { _1.between?(100, 2000) }

  range = (100..2000)

  code 'inline' do
    rand(100..2000)
  end

  code 'explicite' do
    rand(range)
  end

  code 'no_range' do
    rand(100) + 100
  end
end
