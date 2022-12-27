# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'String:concat - concat two Strings' do
  sample = <<-TEXT
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
    non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  TEXT

  code '#+' do
    'just a test' + sample
  end

  code '"...#{str}"' do
    "just a test#{sample}"
  end

  code '#<<' do
    +'just a test' << sample
  end

  code '#concat' do
    (+'just a test').concat(sample)
  end

  code '#%' do
    'just a test%s' % sample
  end

  code '#format' do
    format('just a test%s', sample)
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
