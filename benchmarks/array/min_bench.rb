# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array: min' do
  sample_array = Array.new(10, &:itself).shuffle!.freeze

  code '#min',   ->{ sample_array.dup.min }
  code '#sort[0]', ->{ sample_array.dup.sort![0] }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
