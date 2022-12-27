# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Float:from_string - convert a String to Float' do
  sample = '42.21'

  code 'String#to_f' do
    sample.to_f
  end

  code 'Float()' do
    Float(sample)
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
