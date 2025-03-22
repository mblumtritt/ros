# frozen_string_literal: true

return unless defined?(Data.define)

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Hash:from_array - create a Hash from an Array' do
  sample_class = Struct.new(:id, :name)
  array = Array.new(1000) { sample_class.new(_1, "name-#{_1}") }.freeze

  code 'fill' do
    ret = {}
    array.each { ret[_1.id] = _1 }
    ret
  end

  code '#each_with_object' do
    array.each_with_object({}) { |i, ret| ret[i.id] = i }
  end

  code '#to_h' do
    array.to_h { [_1.id, _1] }
  end

  code '#map#zip#to_h' do
    array.map(&:id).zip(array).to_h
  end

  code '.[#map]' do
    Hash[array.map { [_1.id, _1] }]
  end
end
