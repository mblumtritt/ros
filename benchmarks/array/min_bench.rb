# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:min - find the lowest element of an Array' do
  sample = fixture(:integers_subset)

  code '#min' do
    sample.dup.min
  end

  code '#sort![0]' do
    sample.dup.sort![0]
  end
end
