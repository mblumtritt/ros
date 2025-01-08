# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Float:const - float constants' do
  test_with { _1.round(10) }

  sample = 4.45

  code '#*#*' do
    sample * sample * sample * sample * sample
  end

  code '#**5' do
    sample**5
  end
end
