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

  code '#[symbol] || def', -> { sample_sym[:not] || 'default' }
  code '#fetch(symbol, def)', -> { sample_sym.fetch(:not, 'default') }
  code '#[string] || def', -> { sample['not'] || 'default' }
  code '#fetch(string, def)', -> { sample.fetch('not', 'default') }
  code '#fetch(symbol, &blk)', -> { sample_sym.fetch(:not) { 'default' } }
  code '#fetch(string, &blk)', -> { sample.fetch('not') { 'default' } }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
