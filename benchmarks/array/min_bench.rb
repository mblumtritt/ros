# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:min - find the lowest element of an Array' do
  sample_array = fixture(:integers_subset)

  code '#min' do
    sample_array.dup.min
  end

  code '#sort![0]' do
    sample_array.dup.sort![0]
  end
end

RubyOnSpeed.report! __FILE__
