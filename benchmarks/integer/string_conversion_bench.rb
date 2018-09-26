# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Integer: convert from String' do
  code 'String#to_i', ->{ '42'.to_i }
  code 'Integer()',   ->{ Integer('42') }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
