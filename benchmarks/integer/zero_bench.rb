# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Integer:zero - test if an Integer is zero' do
  sample = 42

  code '== 0' do
    sample == 0
  end

  code '0 ==' do
    0 == sample
  end

  code 'zero?' do
    sample.zero?
  end
end
