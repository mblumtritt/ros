# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Integer:range - check if value is in a range' do
  value = 42

  code '=> && <=' do
    value >= 1000 && value <= 2000
  end

  code '#between?' do
    value.between?(1000, 2000)
  end

  code 'Range#include?' do
    (1000...2000).include?(value)
  end
end

RubyOnSpeed.report! __FILE__
