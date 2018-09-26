# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Hash: get non-existing value' do
  sample_hash = begin
    ary = ('a'..'z').to_a.permutation(2).to_a.map!(&:join)
    ary.zip(ary).to_h.freeze
  end
  sample_sym_hash = sample_hash.keys.map!(&:to_sym).zip(sample_hash.values).to_h.freeze

  code '#[symbol] || def',     ->{ sample_sym_hash[:not] || 'default' }
  code '#fetch(symbol, def)',  ->{ sample_sym_hash.fetch(:not, 'default') }
  code '#[string] || def',     ->{ sample_hash['not'] || 'default' }
  code '#fetch(string, def)',  ->{ sample_hash.fetch('not', 'default') }
  code '#fetch(symbol, &blk)', ->{ sample_sym_hash.fetch(:not){ 'default' } }
  code '#fetch(string, &blk)', ->{ sample_hash.fetch('not'){ 'default' } }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
