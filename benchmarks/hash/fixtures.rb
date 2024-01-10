# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.add_fixture(:chars) do
  'abcdefghijklmnopqrstuvwxyz'.chars.permutation(2).to_a.map!(&:join)
end

RubyOnSpeed.add_fixture(:chars_hash) do
  RubyOnSpeed.fixture(:chars).zip(RubyOnSpeed.fixture(:chars)).to_h
end

RubyOnSpeed.add_fixture(:chars_hash_sym) do
  RubyOnSpeed.fixture(:chars_hash).transform_keys(&:to_sym)
end

RubyOnSpeed.add_fixture(:data) do
  sample_class = Data.define(:id, :name)
  Array.new(1000) { |i| sample_class.new(i + 1, "name-#{i}") }
end
