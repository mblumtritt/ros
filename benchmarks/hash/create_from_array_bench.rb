# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Hash: create from Array' do
  TestItem = Struct.new(:id, :name)

  sample_array = Array.new(1000) do |i|
    TestItem.new(i + 1, "name-#{i}")
  end.freeze

  code 'Hash.[]' do
    Hash[sample_array.map{ |i| [i.id, i] }]
  end

  code 'Array.to_h' do
    sample_array.map{ |i| [i.id, i] }.to_h
  end

  code 'fill' do
    ret = {}
    sample_array.each{ |i| ret[i.id] = i }
    ret
  end
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
