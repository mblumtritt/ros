# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Struct:member - access the member of a Struct' do
  SampleStruct = Struct.new(:a, :b, :c, :d)

  code '#method' do
    sample = SampleStruct.new
    sample.a = sample.b = 1
    sample.a += sample.b
  end

  code '#[]' do
    sample = SampleStruct.new
    sample[:a] = sample[:b] = 1
    sample[:a] += sample[:b]
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
