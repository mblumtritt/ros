# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Struct:access_cmp - access Struct member vs. access Hash' \
                   ' pairs' do

  StructSample = Struct.new(:a, :b, :c, :d)

  code 'struct#' do
    sample = StructSample.new
    sample.a = sample.b = 1
    sample.c, sample.d = sample.a, sample.b
    sample.a += sample.b
  end

  code 'hash#' do
    sample = {}
    sample[:a] = sample[:b] = 1
    sample[:c], sample[:d] = sample[:a], sample[:b]
    sample[:a] += sample[:b]
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
