# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:include - check if element is contained' do
  array = [1, 2, 3, 4, 5, 6, 7, 8].freeze

  code 'var|const' do
    array.include?(8)
  end

  code 'inline' do
    [1, 2, 3, 4, 5, 6, 7, 8].include?(8)
  end
end
