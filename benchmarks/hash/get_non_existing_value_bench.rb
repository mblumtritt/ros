require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Hash: get non-existing value' do
  sample_hash = begin
    ary = ('a'..'z').to_a.permutation(2).to_a.map!(&:join)
    Hash[ary.zip(ary)].freeze
  end
  sample_sym_hash = Hash[sample_hash.keys.map!(&:to_sym).zip(sample_hash.values)].freeze

  code '#[symbol] || def',     ->{ sample_sym_hash[:not] || 'default'.freeze }
  code '#fetch(symbol, def)',  ->{ sample_sym_hash.fetch(:not, 'default'.freeze) }
  code '#[string] || def',     ->{ sample_hash['not'.freeze] || 'default'.freeze }
  code '#fetch(string, def)',  ->{ sample_hash.fetch('not'.freeze, 'default'.freeze) }
  code '#fetch(symbol, &blk)', ->{ sample_sym_hash.fetch(:not){ 'default'.freeze } }
  code '#fetch(string, &blk)', ->{ sample_hash.fetch('not'.freeze){ 'default'.freeze } }
end

RubyOnSpeed.report! if $0 == __FILE__
