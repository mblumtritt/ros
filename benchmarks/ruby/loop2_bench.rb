# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby:endless_loop - different (nearly) endless loops' do
  code 'loop' do
    x = 0
    loop do
      x += 1
      break if x == 10
    end
    x
  end

  code 'while' do
    x = 0
    while true # rubocop: disable Style/InfiniteLoop
      x += 1
      break if x == 10
    end
    x
  end

  code 'until' do
    x = 0
    until false # rubocop: disable Style/InfiniteLoop
      x += 1
      break if x == 10
    end
    x
  end
end

RubyOnSpeed.report! __FILE__
