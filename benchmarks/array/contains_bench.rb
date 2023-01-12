# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array:contains - check if an Array contains an element' do
  has_truthy_results!

  sample_array = fixture(:objects)
  sample = sample_array[-42].freeze

  code '#index' do
    sample_array.index(sample)
  end

  code '#find_index' do
    sample_array.find_index(sample)
  end

  code '#include?' do
    sample_array.include?(sample)
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
