# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array: map all items' do
  sample_array = Array.new(100_000, &:itself).freeze

  code '#map' do
    sample_array.dup.map(&:to_s)
  end

  code '#map!' do
    sample_array.dup.map!(&:to_s)
  end
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
