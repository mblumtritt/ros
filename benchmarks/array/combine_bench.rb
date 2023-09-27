# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:combine - create an combined Array' do
  sample_array_a = Array.new(100, &:itself).shuffle!.freeze
  sample_array_b = Array.new(100, &:itself).map!(&:to_s).shuffle!.freeze

  code '#each#each' do
    ret = []
    sample_array_a.each { |a| sample_array_b.each { |b| ret << "#{a}#{b}" } }
    ret
  end

  code '#product' do
    ret = []
    sample_array_a.product(sample_array_b) { |com| ret << com.join }
    ret
  end

  code '#product#join' do
    sample_array_a.product(sample_array_b).map!(&:join)
  end
end

RubyOnSpeed.report! __FILE__
