# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Regexp:match - find Match of an Regexp' do
  text = fixture(:lorem_ipsum)
  sample = /cillum\s/
  SAMPLE_CILLUM = /cillum\s/

  code 'inline' do
    /cillum\s/.match(text)
  end

  code 'var' do
    sample.match(text)
  end

  code 'const' do
    SAMPLE_CILLUM.match(text)
  end
end
