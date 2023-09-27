# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.fixtures(
  chars: 'abcdefghijklmnopqrstuvwxyz'.chars.permutation(2).to_a.map!(&:join)
)
RubyOnSpeed.fixtures(
  chars_hash: RubyOnSpeed.fixture(:chars).zip(RubyOnSpeed.fixture(:chars)).to_h
)

if defined?(Data)
  RubyOnSpeed.fixtures(
    data:
      begin
        sample_class = Data.define(:id, :name)
        Array.new(1000) { |i| sample_class.new(i + 1, "name-#{i}") }
      end
  )
end
