# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Integer:from_string - convert a String to Integer' do
  number = '42'

  code '#to_i' do
    number.to_i
  end

  code 'Integer()' do
    Integer(number)
  end
end
