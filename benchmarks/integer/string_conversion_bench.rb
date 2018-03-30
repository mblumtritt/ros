# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Integer: convert from String' do
  sample = '42'.freeze

  code 'String#to_i', ->{ sample.to_i }
  code 'Integer()',   ->{ Integer(sample) }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
