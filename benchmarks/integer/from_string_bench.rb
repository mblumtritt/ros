# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Integer:from_string - convert a String to Integer' do
  sample = '42'

  code 'String#to_i', -> { sample.to_i }
  code 'Integer()', -> { Integer(sample) }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
