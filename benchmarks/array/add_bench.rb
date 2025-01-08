# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:add - add items to an Array' do
  code '#<<' do
    ret = []
    50.times { ret << _1 }
    ret
  end

  code '#push' do
    ret = []
    50.times { ret.push(_1) }
    ret
  end
end
