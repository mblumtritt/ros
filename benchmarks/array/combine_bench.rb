# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:combine - create an combined Array' do
  int_array = (0..49).to_a.shuffle!.freeze
  str_array = (0..49).map(&:to_s).shuffle!.freeze

  code '#each#each' do
    ret = []
    int_array.each { |a| str_array.each { |b| ret << "#{a}#{b}" } }
    ret
  end

  code '#map#map#flatten' do
    int_array.map { |a| str_array.map { |b| "#{a}#{b}" } }.flatten(1)
  end

  code '#product#join' do
    int_array.product(str_array).map!(&:join)
  end

  code '#product' do
    ret = []
    int_array.product(str_array) { |com| ret << com.join }
    ret
  end
end
