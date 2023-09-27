# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Struct:access - access member Struct/Hash' do
  sample_struct = Struct.new(:a, :b, :c, :d)

  code 'struct#' do
    instance = sample_struct.new
    instance.a = instance.b = 1
    instance.c, instance.d = instance.a, instance.b
    instance.a += instance.b
  end

  code 'hash#' do
    instance = {}
    instance[:a] = instance[:b] = 1
    instance[:c], instance[:d] = instance[:a], instance[:b]
    instance[:a] += instance[:b]
  end
end

RubyOnSpeed.report! __FILE__
