# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Regexp:match - named match groups' do
  text = 'fg:aaffee'
  sample = /\A(?<base>fg|bg|on|ul)?[_:]?#?(?<value>[[:xdigit:]]{1,6})\z/

  code 'explicite' do
    match = sample.match(text) and [match[:base], match[:value]]
  end

  code 'implicite' do
    if /\A(?<base>fg|bg|on|ul)?[_:]?#?(?<value>[[:xdigit:]]{1,6})\z/ =~ text
      [base, value]
    end
  end
end
