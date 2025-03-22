# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:copy - create a copy of an Array' do
  array = Array.new(255) { Object.new }.freeze

  code '.new' do
    Array.new(array)
  end

  code '#dup' do
    Array.new(array)
  end

  code '[*array]' do
    [*array]
  end
end
