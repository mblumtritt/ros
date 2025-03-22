# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark(
  'String:start - test if s String starts with a given String'
) do
  string = 'Hello World!'

  code '#start_with?' do
    string.start_with?('Hello')
  end

  code '#[0..n]#==' do
    string[0..4] == 'Hello'
  end

  code '#[0, n]#==' do
    string[0, 5] == 'Hello'
  end
end
