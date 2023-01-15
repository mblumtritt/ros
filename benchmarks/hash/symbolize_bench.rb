# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Hash:symbolize - symbolize all keys of a Hash' do
  sample = fixture(:chars_hash)

  code '#transform_keys' do
    sample.transform_keys(&:to_sym)
  end

  code 'iterate' do
    ret = {}
    sample.each_pair { |k, v| ret[k.to_sym] = v }
    ret
  end

  code 'mapped keys' do
    sample.keys.map!(&:to_sym).zip(sample.values).to_h
  end

  code 'iterate2' do
    sample.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }
  end
end

RubyOnSpeed.report! __FILE__
