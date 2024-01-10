# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'String::format - format a Float with two digits' do
  code 'String#%' do
    '%.2f' % Math::PI
  end

  code 'Kernel#format' do
    format('%.2f', Math::PI)
  end

  code 'Kernel#format_named' do
    format('%<pi>.2f', pi: Math::PI)
  end

  code 'Float#round#to_s' do
    Math::PI.round(2).to_s
  end

  code 'Float#round (embed)' do
    "#{Math::PI.round(2)}"
  end
end
