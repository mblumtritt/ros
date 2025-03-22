# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

SampleClass = Struct.new(:a, :b, :c, :d)

RubyOnSpeed.benchmark 'Struct:member - access the member of a Struct' do
  code '#method' do
    sample = SampleClass.new
    sample.a = sample.b = 1
    sample.a += sample.b
  end

  code '#[]' do
    sample = SampleClass.new
    sample[:a] = sample[:b] = 1
    sample[:a] += sample[:b]
  end
end
