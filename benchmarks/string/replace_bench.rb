# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'String:replace - replace all sub strings' do
  sample = fixture(:lorem_ipsum)

  code '#gsub(a, b)' do
    str = sample.dup
    str.gsub('in', 'Ruby')
  end

  code '#gsub!(a, b)' do
    str = sample.dup
    str.gsub!('in', 'Ruby')
    str
  end
end

RubyOnSpeed.report! __FILE__
