require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Float: convert from String' do
  sample = '44.21'.freeze

  code 'String#to_f', ->{ sample.to_f }
  code 'Float()',   ->{ Float(sample) }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
