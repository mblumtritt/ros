# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Integer:from_string - convert a String to Integer' do
  sample = '42'

  code 'String#to_i' do
    sample.to_i
  end

  code 'Integer()' do
    Integer(sample)
  end
end
