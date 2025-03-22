# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

SampleClass = Struct.new(:value)

RubyOnSpeed.test 'Proc:to_proc - to_proc vs. call' do
  sample = Array.new(23) { |i| SampleClass.new(i) }
  func = ->(obj) { obj.value }

  code '#to_proc' do
    sample.sum(&:value)
  end

  code '{}' do
    sample.sum { _1.value }
  end

  code '(&)' do
    sample.sum(&func)
  end
end
