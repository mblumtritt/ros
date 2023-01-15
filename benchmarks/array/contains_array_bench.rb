# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array:contains_array - test if all elements of an Array are' \
                   ' included in another Array' do
  sample_array = fixture(:integers)
  sample_subset = Array.new(100) { |i| i + 399 }.freeze

  code '#-#empty?' do
    (sample_subset - sample_array).empty?
  end

  code '#&' do
    (sample_subset & sample_array) == sample_subset
  end

  code '#all?#include?' do
    sample_subset.all? { |e| sample_array.include?(e) }
  end

  code '#all?#index' do
    sample_subset.all? { |e| sample_array.index(e) }
  end
end

RubyOnSpeed.report! __FILE__
