# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'String:concat - concat many Strings' do
  words = <<-LOREM_IPSUM.split(/\b/)
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat.
  LOREM_IPSUM

  code '#+' do
    ret = +''
    words.each { ret += _1 }
    ret
  end

  code '"...#{str}"' do
    ret = +''
    words.each { ret = "#{ret}#{_1}" }
    ret
  end

  code '#<<' do
    ret = +''
    words.each { ret << _1 }
    ret
  end

  code '#concat' do
    ret = +''
    words.each { ret.concat(_1) }
    ret
  end
end
