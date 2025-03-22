# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark(
  'Array:contains_array - Array elements included in another Array'
) do
  array = (0..1000).to_a.shuffle!.freeze
  subset = array.sample(array.size / 2).shuffle!.freeze

  code '#-#empty?' do
    (subset - array).empty?
  end

  code '#intersection#==' do
    subset.intersection(array) == subset
  end

  code '#&#==' do
    (subset & array) == subset
  end

  code '#all?#index' do
    subset.all? { array.index(_1) }
  end

  code '#all?#include?' do
    subset.all? { array.include?(_1) }
  end
end
