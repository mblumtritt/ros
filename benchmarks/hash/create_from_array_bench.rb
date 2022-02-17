# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Hash: create from Array' do
  TestItem = Struct.new(:id, :name)

  sample_array = Array.new(1000) { |i| TestItem.new(i + 1, "name-#{i}") }.freeze

  code 'Hash.[]' do
    Hash[sample_array.map { |i| [i.id, i] }]
  end

  code 'Array.to_h' do
    sample_array.map { |i| [i.id, i] }.to_h
  end

  code 'fill' do
    ret = {}
    sample_array.each { |i| ret[i.id] = i }
    ret
  end

  code '#each_with_object' do
    sample_array.each_with_object({}) { |i, ret| ret[i.id] = i }
  end
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
