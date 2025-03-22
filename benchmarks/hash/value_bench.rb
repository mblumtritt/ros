# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Hash:value - find value from a key' do
  sample = ('aa'..'zz').to_h { [_1, _1] }.freeze
  sample_sym = sample.transform_keys(&:to_sym).freeze
  sample_sym_identity = Hash[sample_sym].compare_by_identity.freeze

  code '#[symbol] (*)' do
    sample_sym_identity[:ru]
  end

  code '#[symbol]' do
    sample_sym[:ru]
  end

  code '#[string]' do
    sample['ru']
  end

  code '#fetch(symbol) (*)' do
    sample_sym_identity.fetch(:ru, 'bad')
  end

  code '#fetch(symbol)' do
    sample_sym.fetch(:ru, 'bad')
  end

  code '#fetch(string)' do
    sample.fetch('ru')
  end
end
