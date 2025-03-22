# frozen_string_literal: true

require 'date'
require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:map_some - modify' do
  array = (Date.new(2012)..Date.new(2014)).to_a.freeze

  code '#select#map!' do
    array.select(&:saturday?).map!(&:to_s)
  end

  code '#map#compact!' do
    array.map { |e| e.to_s if e.saturday? }.compact!
  end

  code '#each#cmp' do
    ret = []
    array.each { |e| ret << e.to_s if e.saturday? }
    ret
  end

  code '#each_with_object#cmp' do
    array.each_with_object([]) { |e, ret| ret << e.to_s if e.saturday? }
  end

  code '#filter_map' do
    array.filter_map { |e| e.to_s if e.saturday? }
  end

  code 'copy#keep_if#map!' do
    Array.new(array).keep_if(&:saturday?).map!(&:to_s)
  end
end
