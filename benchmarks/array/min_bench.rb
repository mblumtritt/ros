# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array:min - find the lowest element of an Array' do
  sample_array = Array.new(10, &:itself).shuffle!.freeze

  code '#min' do
    sample_array.dup.min
  end

  code '#sort[0]' do
    sample_array.dup.sort![0]
  end
end

RubyOnSpeed.report! __FILE__
