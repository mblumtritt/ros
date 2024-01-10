# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Proc:call - call a Proc with parameters' do
  sample = proc { |x, y| x + y }

  code '#call' do
    sample.call(28, 14)
  end

  code '#[]' do
    sample[28, 14]
  end

  code '#()' do
    sample.(28, 14)
  end

  code '#yield' do
    sample.yield(28, 14)
  end
end
