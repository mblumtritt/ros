# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Float:zero - test if a Float is zero' do
  sample = 42.21

  code '== 0' do
    sample == 0
  end

  code '0 ==' do
    0 == sample
  end

  code '== 0.0' do
    sample == 0.0
  end

  code '0.0 ==' do
    0.0 == sample
  end

  code 'zero?' do
    sample.zero?
  end
end

RubyOnSpeed.report! __FILE__
