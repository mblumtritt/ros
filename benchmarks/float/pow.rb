# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Float:const - float constants' do
  test_with { _1.round(10) }

  number = 4.45

  code 'x**5' do
    number**5
  end

  code 'x * x * x * x * x' do
    number * number * number * number * number
  end
end
