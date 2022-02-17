# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Hash: create copy' do
  sample_hash =
    begin
      ary = ('a'..'z').to_a.permutation(2).to_a.map!(&:join)
      ary.zip(ary).to_h.freeze
    end

  code '::[]', -> { Hash[sample_hash] }
  code '#dup', -> { sample_hash.dup }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
