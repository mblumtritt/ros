# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Hash:copy - create a copy of a Hash' do
  sample =
    begin
      ary = ('a'..'z').to_a.permutation(2).to_a.map!(&:join)
      ary.zip(ary).to_h.freeze
    end

  code '::[]', -> { Hash[sample] }
  code '#dup', -> { sample.dup }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
