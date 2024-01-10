# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Struct:member - access the member of a Struct' do
  struct = Struct.new(:a, :b, :c, :d)

  code '#method' do
    sample = struct.new
    sample.a = sample.b = 1
    sample.a += sample.b
  end

  code '#[]' do
    sample = struct.new
    sample[:a] = sample[:b] = 1
    sample[:a] += sample[:b]
  end
end
