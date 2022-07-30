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

  code '#[symbol]', -> { sample_sym[:ru] }
  code '#fetch(symbol)', -> { sample_sym.fetch(:ru) }
  code '#[symbol] (*)', -> { sample_sym_identity[:ru] }
  code '#fetch(symbol) (*)', -> { sample_sym_identity.fetch(:ru) }
  code '#[string]', -> { sample['ru'] }
  code '#fetch(string)', -> { sample.fetch('ru') }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
