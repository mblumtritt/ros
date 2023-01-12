# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Hash:value - find value from a key' do
  sample =
    begin
      ary = ('a'..'z').to_a.permutation(2).to_a.map!(&:join)
      ary.zip(ary).to_h.freeze
    end
  sample_sym = sample.keys.map!(&:to_sym).zip(sample.values).to_h.freeze
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
