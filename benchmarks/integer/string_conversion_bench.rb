require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Integer: convert from String' do
  sample = '42'.freeze

  code 'String#to_i', ->{ sample.to_i }
  code 'Integer()',   ->{ Integer(sample) }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
