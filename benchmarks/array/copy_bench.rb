# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:copy - create a copy of an Array' do
  sample = fixture(:objects)

  code '::new' do
    Array.new(sample)
  end

  code '#dup' do
    sample.dup
  end

  code '[*array]' do
    [*sample]
  end
end
