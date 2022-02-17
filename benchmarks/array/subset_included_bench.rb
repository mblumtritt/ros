# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array: subset included' do
  sample_all = [*(1..500)].freeze
  sample_subset = [*(400..500)].freeze

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
