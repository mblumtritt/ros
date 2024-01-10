# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'String: replace_first - replace first sub string' do
  sample = fixture(:lorem_ipsum)

  code '#[a]=b' do
    str = sample.dup
    str['veniam'] = 'Ruby'
    str
  end

  code 'at_index' do
    str = sample.dup
    idx = str.index('veniam') and str[idx, 'veniam'.size] = 'Ruby'
    str
  end

  code '#sub(a, b)' do
    str = sample.dup
    str.sub('veniam', 'Ruby')
  end

  code '#sub!(a, b)' do
    str = sample.dup
    str.sub!('veniam', 'Ruby')
    str
  end

  code '#gsub(a, b)' do
    str = sample.dup
    str.gsub('veniam', 'Ruby')
  end

  code '#gsub!(a, b)' do
    str = sample.dup
    str.gsub!('veniam', 'Ruby')
    str
  end
end
