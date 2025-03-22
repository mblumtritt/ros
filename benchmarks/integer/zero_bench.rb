# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Integer:zero - test if an Integer is zero' do
  number = 42

  code '== 0' do
    number == 0
  end

  code '0 ==' do
    0 == number
  end

  code 'zero?' do
    number.zero?
  end
end
