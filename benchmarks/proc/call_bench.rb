# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Proc: call' do
  sample_proc = proc { |x, y| x + y }

  code '#call', -> { sample_proc.call(28, 14) }
  code '#[]', -> { sample_proc[28, 14] }
  code '#()', -> { sample_proc.(28, 14) }
  code '#yield', -> { sample_proc.yield(28, 14) }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
