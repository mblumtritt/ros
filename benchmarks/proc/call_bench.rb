# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Proc:call - call a Proc with parameters' do
  sample = proc { |x, y| x + y }

  code '#call', -> { sample.call(28, 14) }
  code '#[]', -> { sample[28, 14] }
  code '#()', -> { sample.(28, 14) }
  code '#yield', -> { sample.yield(28, 14) }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
