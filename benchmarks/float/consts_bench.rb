# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Float:const - float constants' do
  number = 4.45

  code '* const' do
    number * 0.5454545454545454
  end

  code '* term' do
    number * (1.5 / 2.75)
  end
end
