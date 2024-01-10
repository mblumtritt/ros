# frozen_string_literal: true

return unless defined?(Data.define)

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Hash:from_array - create a Hash from an Array' do
  data = fixture(:data)

  code 'Hash.[]' do
    Hash[data.map { |i| [i.id, i] }]
  end

  code '#to_h' do
    data.to_h { |i| [i.id, i] }
  end

  code 'fill' do
    ret = {}
    data.each { |i| ret[i.id] = i }
    ret
  end

  code '#each_with_object' do
    data.each_with_object({}) { |i, ret| ret[i.id] = i }
  end

  code '#map#zip#to_h' do
    data.map(&:id).zip(data).to_h
  end
end
