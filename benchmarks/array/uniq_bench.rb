# frozen_string_literal: true

require 'set' # for some older Ruby versions
require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:unique - remove all duplicates from an Array' do
  array = (Array.new(100) { Object.new } * 2).shuffle!.freeze

  code 'uniq' do
    array.uniq
  end

  code 'viaSet' do
    Set.new(array).compare_by_identity.to_a
  end

  code 'viaHash' do
    h = {}.compare_by_identity
    array.each { h[_1] = 1 }
    h.keys
  end
end
