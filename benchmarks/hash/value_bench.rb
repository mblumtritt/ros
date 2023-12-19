# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Hash:value - find value from a key' do
  sample = fixture(:chars_hash)
  sample_sym = fixture(:chars_hash_sym)
  sample_sym_identity = Hash[sample_sym].compare_by_identity.freeze

  code '#[symbol]' do
    sample_sym[:ru]
  end

  code '#fetch(symbol)' do
    sample_sym.fetch(:ru)
  end

  code '#[symbol] (*)' do
    sample_sym_identity[:ru]
  end

  code '#fetch(symbol) (*)' do
    sample_sym_identity.fetch(:ru)
  end

  code '#[string]' do
    sample['ru']
  end

  code '#fetch(string)' do
    sample.fetch('ru')
  end
end

RubyOnSpeed.report! __FILE__
