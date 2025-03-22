# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'String:concat - concat two Strings' do
  string = <<-LOREM_IPSUM
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
    non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  LOREM_IPSUM

  code '#+' do
    'just a test' + string
  end

  code '"...#{str}"' do
    "just a test#{string}"
  end

  code '#<<' do
    +'just a test' << string
  end

  code '#concat' do
    (+'just a test').concat(string)
  end

  code '#%' do
    'just a test%s' % string
  end

  code '#format' do
    format('just a test%s', string)
  end
end
