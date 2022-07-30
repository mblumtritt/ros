# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'String:start - test if s String starts with a given String' do
  sample = 'Hello World!'

  code '#start_with?' do
    sample.start_with?('Hello')
  end

  code '#[0..n]#==' do
    sample[0..4] == 'Hello'
  end

  code '#[0, n]#==' do
    sample[0, 5] == 'Hello'
  end
end

RubyOnSpeed.test! if __FILE__ == Process.argv0
RubyOnSpeed.report! if __FILE__ == Process.argv0
