# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Regexp:match - match groups' do
  text = 'fg:aaffee'
  regexp = /\A(?<base>fg|bg|on|ul)?[_:]?#?(?<value>[[:xdigit:]]{1,6})\z/

  code 'named-explicite' do
    match = regexp.match(text) and [match[:base], match[:value]]
  end

  code 'named-implicite' do
    if /\A(?<base>fg|bg|on|ul)?[_:]?#?(?<value>[[:xdigit:]]{1,6})\z/ =~ text
      [base, value]
    end
  end

  code 'unnamed-implicite' do
    /\A(fg|bg|on|ul)?[_:]?#?([[:xdigit:]]{1,6})\z/.match(text)&.captures
  end
end
