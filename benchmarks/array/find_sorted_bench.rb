# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:find_sorted - find element in a sorted Array' do
  sample = fixture(:sorted_dates)

  code '#bsearch' do
    sample.bsearch { |element| element.year > 2014 }
  end

  code '#[array#find_index]' do
    result = sample.find_index { |element| element.year > 2014 }
    sample[result] if result
  end

  code '#[array#index]' do
    result = sample.index { |element| element.year > 2014 }
    sample[result] if result
  end

  code '#find' do # uses Enumerable#find
    sample.find { |element| element.year > 2014 }
  end

  code '#detect' do # uses Enumerable#detect
    sample.detect { |element| element.year > 2014 }
  end
end
