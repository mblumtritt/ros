# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array: access first element' do
  sample_array = Array.new(100, &:itself).freeze

  code '#[0]', -> { sample_array[0] }
  code '#first', -> { sample_array.first }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
