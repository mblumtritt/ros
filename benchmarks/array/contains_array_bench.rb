# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark(
  'Array:contains_array - Array elements included in another Array'
) do
  sample = fixture(:integers)
  subset = fixture(:integers_subset)

  code '#-#empty?' do
    (subset - sample).empty?
  end

  code '#&' do
    (subset & sample) == subset
  end

  code '#all?#include?' do
    subset.all? { |e| sample.include?(e) }
  end

  code '#all?#index' do
    subset.all? { |e| sample.index(e) }
  end
end
