require_relative '../lib/ruby_on_speed'

SAMPLE_HASH = begin
  ary = ('a'..'z').to_a.permutation(2).to_a.map!(&:join)
  Hash[ary.zip(ary)].freeze
end
SAMPLE_SYM_HASH = Hash[SAMPLE_HASH.keys.map!(&:to_sym).zip(SAMPLE_HASH.values)].freeze

RubyOnSpeed.check do
  code 'Hash#dup', ->{ SAMPLE_HASH.dup }
  code 'Hash::[]', ->{ Hash[SAMPLE_HASH] }
end

RubyOnSpeed.check do
  code 'Hash#[symbol]',      ->{ SAMPLE_SYM_HASH[:ru] }
  code 'Hash#fetch(symbol)', ->{ SAMPLE_SYM_HASH.fetch(:ru) }
  code 'Hash#[string]',      ->{ SAMPLE_HASH['ru'.freeze] }
  code 'Hash#fetch(string)', ->{ SAMPLE_HASH.fetch('ru'.freeze) }
end

RubyOnSpeed.check do
  code 'Hash#fetch(k, def)',  ->{ SAMPLE_HASH.fetch(:not_found, :default) }
  code 'Hash#fetch(k, &blk)', ->{ SAMPLE_HASH.fetch(:not_found){ :default } }
end

RubyOnSpeed.check do
  code 'Hash#sort',      ->{ SAMPLE_HASH.sort.to_h }
  code 'Hash#sort_by',   ->{ SAMPLE_HASH.sort_by{ |k, _| k }.to_h }
  code 'Hash#keys.sort', ->{ Hash[SAMPLE_HASH.keys.sort!.zip(SAMPLE_HASH.values)] }
end

RubyOnSpeed.check do
  code 'Hash#merge!' do
    hash = Hash[SAMPLE_HASH]
    hash.merge!(SAMPLE_SYM_HASH)
  end

  code 'Hash#[]=' do
    hash = Hash[SAMPLE_HASH]
    SAMPLE_SYM_HASH.each_pair{ |k, v| hash[k] = v }
    hash
  end
end

RubyOnSpeed.check do
  code 'Hash#merge' do
    SAMPLE_HASH.merge(SAMPLE_SYM_HASH)
  end

  code 'Hash#[]=' do
    Hash[SAMPLE_HASH.to_a.concat(SAMPLE_SYM_HASH.to_a)]
  end
end

RubyOnSpeed.check do
  code 'Hash#symbolize1' do
    Hash[SAMPLE_HASH.keys.map!(&:to_sym).zip(SAMPLE_HASH.values)]
  end

  code 'Hash#symbolize2' do
    ret = {}
    SAMPLE_HASH.each_pair{ |k, v| ret[k.to_sym] = v }
    ret
  end

  code 'Hash#symbolize3' do
    SAMPLE_HASH.each_with_object({}){ |(k, v), h| h[k.to_sym] = v }
  end
end

RubyOnSpeed.check do
  code 'Hash#store', ->{ {}.store(42, :Ruby) }
  code 'Hash#[]=',   ->{ {}[42] = :Ruby }
end

RubyOnSpeed.check do
  code 'Enumarable#each_with_object', ->{ SAMPLE_HASH.each_with_object([]){ |(k, v), m| m << k << v} }
  code 'Hash#each_pair',   ->{ m = []; SAMPLE_HASH.each_pair{ |k, v| m << k << v} }
end
