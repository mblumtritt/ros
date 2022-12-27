# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Hash:invalid_value - find value of a non-existing key in ' \
                   'a Hash' do
  sample =
    begin
      ary = ('a'..'z').to_a.permutation(2).to_a.map!(&:join)
      ary.zip(ary).to_h.freeze
    end
  sample_sym = sample.keys.map!(&:to_sym).zip(sample.values).to_h.freeze

  code '#[symbol] || def' do
    sample_sym[:not] || 'default'
  end

  code '#fetch(symbol, def)' do
    sample_sym.fetch(:not, 'default')
  end

  code '#[string] || def' do
    sample['not'] || 'default'
  end

  code '#fetch(string, def)' do
    sample.fetch('not', 'default')
  end

  code '#fetch(symbol, &blk)' do
    sample_sym.fetch(:not) { 'default' }
  end

  code '#fetch(string, &blk)' do
    sample.fetch('not') { 'default' }
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
