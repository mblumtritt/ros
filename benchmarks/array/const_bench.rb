# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:include - check if element is contained' do
  sample = [1, 2, 3, 4, 5, 6, 7, 8]
  SAMPLE_INTS = [1, 2, 3, 4, 5, 6, 7, 8].freeze

  code 'inline' do
    [1, 2, 3, 4, 5, 6, 7, 8].include?(8)
  end

  code 'var' do
    sample.include?(8)
  end

  code 'const' do
    SAMPLE_INTS.include?(8)
  end
end
