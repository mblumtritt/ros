# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array:first - access the first element of an Array' do
  sample_array = Array.new(100, &:itself).freeze

  code '#[0]' do
    sample_array[0]
  end

  code '#first' do
    sample_array.first
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
