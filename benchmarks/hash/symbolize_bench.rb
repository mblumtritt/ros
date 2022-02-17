# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Hash: symbolize keys' do
  sample_hash =
    begin
      ary = ('a'..'z').to_a.permutation(2).to_a.map!(&:join)
      ary.zip(ary).to_h.freeze
    end

  code '#transform_keys' do
    sample_hash.transform_keys(&:to_sym)
  end

  code 'iterate' do
    ret = {}
    sample_hash.each_pair { |k, v| ret[k.to_sym] = v }
    ret
  end

  code 'mapped keys' do
    sample_hash.keys.map!(&:to_sym).zip(sample_hash.values).to_h
  end

  code 'iterate2' do
    sample_hash.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
