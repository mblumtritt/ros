# frozen_string_literal: true

require 'stringio'
require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark('String:line_split - split lines') do
  string = <<-LOREM_IPSUM
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
    non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  LOREM_IPSUM

  code '#each_line#map' do
    string.each_line(chomp: true).to_a
  end

  code '#split#map' do
    string.split("\n").map!(&:chomp)
  end
end
