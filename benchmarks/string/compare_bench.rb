# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'String:casecmp - comparing two Strings case-insensitive' do
  sample = <<-TEXT
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
    non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  TEXT

  code '#==', -> { sample.downcase == sample.downcase }
  code '#casecmp', -> { sample.casecmp(sample).zero? }
  code '#casecmp?', -> { sample.casecmp?(sample) }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0