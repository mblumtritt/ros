require_relative '../../lib/ruby_on_speed'

# #index & #find_index seems to be same on MRI
RubyOnSpeed.test 'Array: index' do
  sample_array = Array.new(1000){ Object.new }
  sample = sample_array[-1]

  code '#index(obj)',      ->{ sample_array.index(sample) }
  code '#find_index(obj)', ->{ sample_array.find_index(sample) }
  code '#index(&bl)',      ->{ sample_array.index{ |i| i == sample } }
  code '#find_index(&bl)', ->{ sample_array.find_index{ |i| i == sample } }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
