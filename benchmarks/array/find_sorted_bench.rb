# frozen_string_literal: true

require 'date'
require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:find_sorted - find element in a sorted Array' do
  array = (Date.new(2012)..Date.new(2015)).to_a.freeze

  code '#bsearch' do
    array.bsearch { |element| element.year > 2014 }
  end

  code '#[array#find_index]' do
    result = array.find_index { |element| element.year > 2014 }
    array[result] if result
  end

  code '#[array#index]' do
    result = array.index { |element| element.year > 2014 }
    array[result] if result
  end

  code '#find' do # uses Enumerable#find
    array.find { |element| element.year > 2014 }
  end

  code '#detect' do # uses Enumerable#detect
    array.detect { |element| element.year > 2014 }
  end
end
