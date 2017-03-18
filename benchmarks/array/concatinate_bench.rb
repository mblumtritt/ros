require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Array: concatinate' do
  sample_array = Array.new(1000){ |n| n }.freeze

  code '#+',      ->{ Array.new(sample_array) + sample_array }
  code '#concat', ->{ Array.new(sample_array).concat(sample_array) }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
