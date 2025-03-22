# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Hash:symbolize - symbolize all keys of a Hash' do
  sample = ('aa'..'zz').to_h { [_1, _1] }.freeze

  code '#transform_keys' do
    sample.transform_keys(&:to_sym)
  end

  code 'iterate' do
    ret = {}
    sample.each_pair { |k, v| ret[k.to_sym] = v }
    ret
  end

  code '#keys#map#zip#to_h' do
    sample.keys.map!(&:to_sym).zip(sample.values).to_h
  end
end
