# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:combine - create an combined Array' do
  sample_a = Array.new(50, &:itself).shuffle!.freeze
  sample_b = Array.new(50, &:itself).map!(&:to_s).shuffle!.freeze

  code '#each#each' do
    ret = []
    sample_a.each { |a| sample_b.each { |b| ret << "#{a}#{b}" } }
    ret
  end

  code '#map#map' do
    sample_a.map { |a| sample_b.map { |b| "#{a}#{b}" } }.flatten(1)
  end

  code '#product' do
    ret = []
    sample_a.product(sample_b) { |com| ret << com.join }
    ret
  end

  code '#product#join' do
    sample_a.product(sample_b).map!(&:join)
  end
end
