# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array:copy - create a copy of an Array' do
  sample_array = fixture(:objects)

  code '::new' do
    Array.new(sample_array)
  end

  code '#dup' do
    sample_array.dup
  end

  code '[*array]' do
    [*sample_array]
  end
end

RubyOnSpeed.report! __FILE__
