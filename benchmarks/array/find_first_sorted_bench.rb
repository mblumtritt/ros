# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'
require 'date'

RubyOnSpeed.test 'Array: find first (sorted)' do
  sample_array = (Date.new(2000)..Date.new(2015)).to_a.freeze # is sorted

  code '#bsearch' do
    sample_array.bsearch{ |element| element.year > 2014 }
  end

  code '#[array#find_index]' do
    result = sample_array.find_index{ |element| element.year > 2014 }
    next sample_array[result] if result
    nil
  end

  code '#[array#index]' do
    result = sample_array.index{ |element| element.year > 2014 }
    next sample_array[result] if result
    nil
  end

  code '#find' do # uses Enumerable#find
    sample_array.find{ |element| element.year > 2014 }
  end

  code '#detect' do # uses Enumerable#detect
    sample_array.detect{ |element| element.year > 2014 }
  end
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
