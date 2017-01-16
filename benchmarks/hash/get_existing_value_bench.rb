require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Hash: get existing value' do
  sample_hash = begin
    ary = ('a'..'z').to_a.permutation(2).to_a.map!(&:join)
    Hash[ary.zip(ary)].freeze
  end
  sample_sym_hash = Hash[sample_hash.keys.map!(&:to_sym).zip(sample_hash.values)].freeze
  sample_sym_identity_hash = Hash[sample_sym_hash].compare_by_identity

  code '#[symbol]',          ->{ sample_sym_hash[:ru] }
  code '#fetch(symbol)',     ->{ sample_sym_hash.fetch(:ru) }
  code '#[symbol] (*)',      ->{ sample_sym_identity_hash[:ru] }
  code '#fetch(symbol) (*)', ->{ sample_sym_identity_hash.fetch(:ru) }
  code '#[string]',          ->{ sample_hash['ru'.freeze] }
  code '#fetch(string)',     ->{ sample_hash.fetch('ru'.freeze) }
end

RubyOnSpeed.report! if $0 == __FILE__
