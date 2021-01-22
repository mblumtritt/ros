# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array: map some items' do
  require 'date'

  sample_array = (Date.new(2000)..Date.new(2015)).to_a.freeze

  code '#select#map!' do
    sample_array.select(&:saturday?).map!(&:to_s)
  end

  code '#map#compact!' do
    ret = sample_array.map{ |e| e.saturday? ? e.to_s : nil }
    ret.compact!
    ret
  end

  code '#map#tap#compact!' do
    sample_array.map{ |e| e.saturday? ? e.to_s : nil }.tap(&:compact!)
  end

  code '#each#cmp' do
    ret = []
    sample_array.each{ |e| ret << e.to_s if e.saturday? }
    ret
  end

  code '#tap#each#cmp' do
    [].tap do |ret|
      sample_array.each{ |e| ret << e.to_s if e.saturday? }
    end
  end

  code '#each_with_object#cmp' do
    sample_array.each_with_object([]){ |e, ret| ret << e.to_s if e.saturday? }
  end

  code '#filter_map' do
    sample_array.filter_map{ |e| e.saturday? ? e.to_s : nil }
  end

  code 'copy#keep_if#map!' do
    Array.new(sample_array).keep_if(&:saturday?).map!(&:to_s)
  end
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
