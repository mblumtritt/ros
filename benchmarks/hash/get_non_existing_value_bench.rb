require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Hash: get non-existing value' do
  sample_hash = begin
    ary = ('a'..'z').to_a.permutation(2).to_a.map!(&:join)
    ary.zip(ary).to_h.freeze
  end
  sample_sym_hash = sample_hash.keys.map!(&:to_sym).zip(sample_hash.values).to_h.freeze

  code '#[symbol] || def',     ->{ sample_sym_hash[:not] || 'default'.freeze }
  code '#fetch(symbol, def)',  ->{ sample_sym_hash.fetch(:not, 'default'.freeze) }
  code '#[string] || def',     ->{ sample_hash['not'.freeze] || 'default'.freeze }
  code '#fetch(string, def)',  ->{ sample_hash.fetch('not'.freeze, 'default'.freeze) }
  code '#fetch(symbol, &blk)', ->{ sample_sym_hash.fetch(:not){ 'default'.freeze } }
  code '#fetch(string, &blk)', ->{ sample_hash.fetch('not'.freeze){ 'default'.freeze } }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
