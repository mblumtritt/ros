# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'String: replace all' do
  sample_string = <<-SAMPLE_STRING
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  SAMPLE_STRING

  code '#gsub(a, b)' do
    str = sample_string.dup
    str.gsub('in', 'Ruby')
  end

  code '#gsub!(a, b)' do
    str = sample_string.dup
    str.gsub!('in', 'Ruby')
    str
  end
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
