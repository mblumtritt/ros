# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Hash:copy - create a copy of a Hash' do
  sample = fixture(:chars_hash)

  code '::[]' do
    Hash[sample]
  end

  code '#dup' do
    sample.dup
  end
end

RubyOnSpeed.report! __FILE__
