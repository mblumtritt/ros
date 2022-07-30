# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array: subset included' do
  sample_all = Array.new(500, &:itself).freeze
  sample_subset = Array.new(100){ |i| i + 399}.freeze

  code '#-#empty?' do
    (sample_subset - sample_all).empty?
  end

  code '#&' do
    (sample_subset & sample_all) == sample_subset
  end

  code '#all?#include?' do
    sample_subset.all? { |e| sample_all.include?(e) }
  end

  code '#all?#index' do
    sample_subset.all? { |e| sample_all.index(e) }
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
