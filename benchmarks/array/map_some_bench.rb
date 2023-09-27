# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:map_some - modify' do
  sample_array = fixture(:sorted_dates)

  code '#select#map!' do
    sample_array.select(&:saturday?).map!(&:to_s)
  end

  code '#map#compact!' do
    sample_array.map { |e| e.saturday? ? e.to_s : nil }.compact!
  end

  code '#each#cmp' do
    ret = []
    sample_array.each { |e| ret << e.to_s if e.saturday? }
    ret
  end

  code '#each_with_object#cmp' do
    sample_array.each_with_object([]) { |e, ret| ret << e.to_s if e.saturday? }
  end

  code '#filter_map' do
    sample_array.filter_map { |e| e.saturday? ? e.to_s : nil }
  end

  code 'copy#keep_if#map!' do
    Array.new(sample_array).keep_if(&:saturday?).map!(&:to_s)
  end
end

RubyOnSpeed.report! __FILE__
