# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Float: convert from String' do
  code 'String#to_f', -> { '44.21'.to_f }
  code 'Float()', -> { Float('44.21') }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
