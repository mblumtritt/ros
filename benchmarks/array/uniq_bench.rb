# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:unique - remove all duplicates from an Array' do
  sample_array = (fixture(:objects) * 2).shuffle!.freeze

  code 'uniq' do
    sample_array.uniq
  end

  code 'copy#uniq!' do
    ret = Array.new(sample_array)
    ret.uniq!
    ret
  end

  code 'viaSet' do
    Set.new(sample_array).to_a
  end

  code 'viaHash' do
    h = {}.compare_by_identity
    sample_array.each { |e| h[e] = 1 }
    h.keys
  end
end

RubyOnSpeed.report! __FILE__
