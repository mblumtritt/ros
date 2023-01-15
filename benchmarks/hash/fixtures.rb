# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed::Fixtures[:chars] = 'abcdefghijklmnopqrstuvwxyz'
  .chars
  .permutation(2)
  .to_a
  .map!(&:join)

RubyOnSpeed::Fixtures[:chars_hash] = RubyOnSpeed::Fixtures[:chars].zip(
  RubyOnSpeed::Fixtures[:chars]
).to_h
