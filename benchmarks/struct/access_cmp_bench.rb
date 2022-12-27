# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Struct:access_cmp - access member Struct/Hash' do
  sample = Struct.new(:a, :b, :c, :d)

  code 'struct#' do
    instance = sample.new
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

RubyOnSpeed.report! if __FILE__ == Process.argv0
