# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Float:from_string - convert a String to Float' do
  string = '42.21'

  code '#to_f' do
    string.to_f
  end

  code 'Float()' do
    Float(string)
  end
end
