# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark('Ruby:endless_loop - different (nearly) endless loops') do
  def use_loop(max, x = 0)
    loop { return x if (x += 1) == max }
  end

  def use_while(max, x = 0)
    return x if (x += 1) == max while true
  end

  def use_until(max, x = 0)
    return x if (x += 1) == max until false
  end

  code 'loop' do
    use_loop(10)
  end

  code 'while' do
    use_while(10)
  end

  code 'until' do
    use_until(10)
  end
end
