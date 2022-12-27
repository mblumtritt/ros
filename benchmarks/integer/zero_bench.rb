# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Integer:zero - test if an Integer is zero' do
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

RubyOnSpeed.report! if __FILE__ == Process.argv0
