# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:map_some - modify' do
  sample = fixture(:sorted_dates)

  code '#select#map!' do
    sample.select(&:saturday?).map!(&:to_s)
  end

  code '#map#compact!' do
    sample.map { |e| e.saturday? ? e.to_s : nil }.compact!
  end

  code '#each#cmp' do
    ret = []
    sample.each { |e| ret << e.to_s if e.saturday? }
    ret
  end

  code '#each_with_object#cmp' do
    sample.each_with_object([]) { |e, ret| ret << e.to_s if e.saturday? }
  end

  code '#filter_map' do
    sample.filter_map { |e| e.saturday? ? e.to_s : nil }
  end

  code 'copy#keep_if#map!' do
    Array.new(sample).keep_if(&:saturday?).map!(&:to_s)
  end
end
