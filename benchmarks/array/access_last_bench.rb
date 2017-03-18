require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Array: access last element' do
  sample_array = Array.new(100){ |n| n }

  code '#[-1]',   ->{ sample_array[-1] }
  code '#last', ->{ sample_array.last }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
