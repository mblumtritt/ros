# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array: get count of entries ' do
  sample_array = Array.new(1000).freeze

  code '#size', -> { sample_array.size }
  code '#count', -> { sample_array.count }
  code '#length', -> { sample_array.length }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
