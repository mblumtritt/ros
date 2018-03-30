# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Hash: get existing value' do
  sample_hash = begin
    ary = ('a'..'z').to_a.permutation(2).to_a.map!(&:join)
    ary.zip(ary).to_h.freeze
  end
  sample_sym_hash = sample_hash.keys.map!(&:to_sym).zip(sample_hash.values).to_h.freeze
  sample_sym_identity_hash = Hash[sample_sym_hash].compare_by_identity

  code '#[symbol]',          ->{ sample_sym_hash[:ru] }
  code '#fetch(symbol)',     ->{ sample_sym_hash.fetch(:ru) }
  code '#[symbol] (*)',      ->{ sample_sym_identity_hash[:ru] }
  code '#fetch(symbol) (*)', ->{ sample_sym_identity_hash.fetch(:ru) }
  code '#[string]',          ->{ sample_hash['ru'.freeze] }
  code '#fetch(string)',     ->{ sample_hash.fetch('ru'.freeze) }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
