# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark(
  'String:casecmp - comparing two Strings case-insensitive'
) do
  string = <<-LOREM_IPSUM
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
    non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  LOREM_IPSUM

  code '#==' do
    string.downcase == string.downcase
  end

  code '#casecmp' do
    string.casecmp(string).zero?
  end

  code '#casecmp?' do
    string.casecmp?(string)
  end
end
