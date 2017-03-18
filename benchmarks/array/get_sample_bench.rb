require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Array: get a sample' do
  uses_randomization!
  sample_array = Array.new(1000){ |n| n }

  code '#sample',     ->{ sample_array.sample }
  code '#[rand]',     ->{ sample_array[Random.rand(sample_array.size - 1)] }
  code '#shuffle[0]', ->{ sample_array.shuffle[0] }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
