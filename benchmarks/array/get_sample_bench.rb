# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array: get a sample' do
  uses_randomization!
  sample_array = Array.new(1000, &:itself).freeze
  sample_array_max = sample_array.size - 1

  code '#sample',     ->{ sample_array.sample }
  code '#[rand]',     ->{ sample_array[Random.rand(sample_array.size - 1)] }
  code '#[rand2]',    ->{ sample_array[Random.rand(sample_array_max)] }
  code '#shuffle[0]', ->{ sample_array.shuffle[0] }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
