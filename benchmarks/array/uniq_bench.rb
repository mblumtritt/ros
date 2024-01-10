# frozen_string_literal: true

require 'set' # for some older Ruby versions
require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:unique - remove all duplicates from an Array' do
  sample = (fixture(:objects) * 2).shuffle!.freeze

  code 'uniq' do
    sample.uniq
  end

  code 'copy#uniq!' do
    ret = Array.new(sample)
    ret.uniq!
    ret
  end

  code 'viaSet' do
    Set.new(sample).to_a
  end

  code 'viaHash' do
    h = {}.compare_by_identity
    sample.each { |e| h[e] = 1 }
    h.keys
  end
end
