require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Hash: symbolize keys' do
  sample_hash = begin
    ary = ('a'..'z').to_a.permutation(2).to_a.map!(&:join)
    Hash[ary.zip(ary)].freeze
  end

  code 'iterate' do
    ret = {}
    sample_hash.each_pair{ |k, v| ret[k.to_sym] = v }
    ret
  end

  code 'mapped keys' do
    Hash[sample_hash.keys.map!(&:to_sym).zip(sample_hash.values)]
  end

  code 'iterate2' do
    sample_hash.each_with_object({}){ |(k, v), h| h[k.to_sym] = v }
  end
end

RubyOnSpeed.report! if $0 == __FILE__
