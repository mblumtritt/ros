# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Integer:range - check if value is in a range' do
  sample = 42

  code '=> && <=' do
    sample >= 1000 && sample <= 2000
  end

  code '#between?' do
    sample.between?(1000, 2000)
  end

  code 'Range#include?' do
    (1000..2000).include?(sample)
  end
end
