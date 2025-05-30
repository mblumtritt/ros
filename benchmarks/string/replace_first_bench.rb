# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'String: replace_first - replace first sub string' do
  string = <<-LOREM_IPSUM
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
    non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  LOREM_IPSUM

  code '#[a]=b' do
    str = string.dup
    str['veniam'] = 'Ruby'
    str
  end

  code 'at_index' do
    str = string.dup
    idx = str.index('veniam') and str[idx, 'veniam'.size] = 'Ruby'
    str
  end

  code '#sub(a, b)' do
    str = string.dup
    str.sub('veniam', 'Ruby')
  end

  code '#sub!(a, b)' do
    str = string.dup
    str.sub!('veniam', 'Ruby')
    str
  end

  code '#gsub(a, b)' do
    str = string.dup
    str.gsub('veniam', 'Ruby')
  end

  code '#gsub!(a, b)' do
    str = string.dup
    str.gsub!('veniam', 'Ruby')
    str
  end
end
