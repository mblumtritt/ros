# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Integer:zero - test if an Integer is zero' do
  sample = 42

  code '== 0', -> { sample == 0 }
  code '0 ==', -> { 0 == sample }
  code 'zero?', -> { sample.zero? }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
