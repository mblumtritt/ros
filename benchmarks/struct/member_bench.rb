# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Struct:member - access the member of a Struct' do
  sample_struct = Struct.new(:a, :b, :c, :d)

  code '#method' do
    sample = sample_struct.new
    sample.a = sample.b = 1
    sample.a += sample.b
  end

  code '#[]' do
    sample = sample_struct.new
    sample[:a] = sample[:b] = 1
    sample[:a] += sample[:b]
  end
end

RubyOnSpeed.report! __FILE__
