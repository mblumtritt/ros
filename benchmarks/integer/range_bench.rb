# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Integer:range - check if value is in a range' do
  number = 42

  code '=> && <=' do
    number >= 1000 && number <= 2000
  end

  code '#between?' do
    number.between?(1000, 2000)
  end

  code 'Range#include?' do
    (1000..2000).include?(number)
  end
end
