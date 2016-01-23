require 'date'
require_relative '../lib/ruby_on_speed'

SAMPLE_ARRAY = (Date.new(2000)..Date.new(2015)).to_a.shuffle!.freeze
SAMPLE = SAMPLE_ARRAY.sample

RubyOnSpeed.check do
  code 'Array::new',       ->{ Array.new(SAMPLE_ARRAY) }
  code 'Array#dup',        ->{ SAMPLE_ARRAY.dup }
  code '[*Array]',         ->{ [*SAMPLE_ARRAY] }
end

RubyOnSpeed.check do
  code 'Array#concat', ->{ Array.new(SAMPLE_ARRAY).concat(SAMPLE_ARRAY) }
  code 'Array#+',      ->{ Array.new(SAMPLE_ARRAY) + SAMPLE_ARRAY }
end

RubyOnSpeed.check do
  code 'Array#size',  ->{ SAMPLE_ARRAY.size }
  code 'Array#count', ->{ SAMPLE_ARRAY.count }
end

RubyOnSpeed.check do
  code 'Array#[0]',   ->{ SAMPLE_ARRAY[0] }
  code 'Array#first', ->{ SAMPLE_ARRAY.first }
end

RubyOnSpeed.check do |c|
  code 'Array#[-1]', ->{ SAMPLE_ARRAY[-1] }
  code 'Array#last', ->{ SAMPLE_ARRAY.last }
end

RubyOnSpeed.check do |c|
  uses_randomization!
  code 'Array#sample',     ->{ SAMPLE_ARRAY.sample }
  code 'Array#shuffle[0]', ->{ SAMPLE_ARRAY.shuffle[0] }
end

RubyOnSpeed.check do
  SORTED_SAMPLE_ARRAY = (Date.new(2000)..Date.new(2015)).to_a.freeze

  code 'Array#bsearch' do
    SORTED_SAMPLE_ARRAY.bsearch{ |element| element.year > 2014 }
  end

  code 'Array#sort#bsearch' do
    SORTED_SAMPLE_ARRAY.sort.bsearch{ |element| element.year > 2014 }
  end

  code 'Array[array#index]' do
    result = SORTED_SAMPLE_ARRAY.index{ |element| element.year > 2014 }
    result ? result = SORTED_SAMPLE_ARRAY[result] : nil
  end

  code 'Array#find' do # uses Enumerable#find
    SORTED_SAMPLE_ARRAY.find{ |element| element.year > 2014 }
  end

  code 'Array#detect' do # uses Enumerable#detect
    SORTED_SAMPLE_ARRAY.detect{ |element| element.year > 2014 }
  end
end

RubyOnSpeed.check do
  code 'Array#sort',    ->{ SAMPLE_ARRAY.sort{ |a, b| a.julian <=> b.julian } }
  code 'Array#sort_by', ->{ SAMPLE_ARRAY.sort_by(&:julian) }
end

RubyOnSpeed.check do
  code 'Array#sort!',    ->{ Array.new(SAMPLE_ARRAY).sort!{ |a, b| a.julian <=> b.julian } }
  code 'Array.#sort_by!', ->{ Array.new(SAMPLE_ARRAY).sort_by!(&:julian) }
end

RubyOnSpeed.check do
  # seems to be same on MRI
  code 'Array#index(obj)',      ->{ SAMPLE_ARRAY.index(SAMPLE) }
  code 'Array#find_index(obj)', ->{ SAMPLE_ARRAY.find_index(SAMPLE) }
end

RubyOnSpeed.check do
  # seems to be same on MRI
  code 'Array#index(&bl)',      ->{ SAMPLE_ARRAY.index{ |i| i == SAMPLE } }
  code 'Array#find_index(&bl)', ->{ SAMPLE_ARRAY.find_index{ |i| i == SAMPLE } }
end

RubyOnSpeed.check do
  code 'Array#map_some1' do
    SAMPLE_ARRAY.select(&:saturday?).map!(&:to_s)
  end

  code 'Array#map_some2' do
    ret = SAMPLE_ARRAY.map{ |e| e.saturday? ? e.to_s : nil }
    ret.compact!
    ret
  end

  code 'Array#map_some2b' do
    SAMPLE_ARRAY.map{ |e| e.saturday? ? e.to_s : nil }.tap{ |ret| ret.compact! }
  end

  code 'Array#map_some3' do
    ret = []
    SAMPLE_ARRAY.each{ |e| e.saturday? and ret << e.to_s }
    ret
  end

  code 'Array#map_some3b' do
    [].tap do |ret|
      SAMPLE_ARRAY.each{ |e| e.saturday? and ret << e.to_s }
    end
  end

  code 'Array#map_some3c' do
    SAMPLE_ARRAY.each_with_object([]){ |e, ret| e.saturday? and ret << e.to_s }
  end

  code 'Array#map_some4' do
    Array.new(SAMPLE_ARRAY).keep_if(&:saturday?).map!(&:to_s)
  end
end
