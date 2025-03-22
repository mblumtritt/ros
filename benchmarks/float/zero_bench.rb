# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Float:zero - test if a Float is zero' do
  number = 42.21

  code '== 0.0' do
    number == 0.0
  end

  code '0.0 ==' do
    0.0 == number
  end

  code 'zero?' do
    number.zero?
  end

  code '== 0' do
    number == 0
  end

  code '0 ==' do
    0 == number
  end
end
