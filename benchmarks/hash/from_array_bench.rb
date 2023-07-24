# frozen_string_literal: true

return unless defined?(Data)

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Hash:from_array - create an Hash from an Array' do
  sample_class = Data.define(:id, :name)
  sample = Array.new(1000) { |i| sample_class.new(i + 1, "name-#{i}") }.freeze

  code 'Hash.[]' do
    Hash[sample.map { |i| [i.id, i] }]
  end

  code 'Array.to_h' do
    sample.map { |i| [i.id, i] }.to_h
  end

  code 'fill' do
    ret = {}
    sample.each { |i| ret[i.id] = i }
    ret
  end

  code '#each_with_object' do
    sample.each_with_object({}) { |i, ret| ret[i.id] = i }
  end

  code '#zip#to_h' do
    sample.map(&:id).zip(sample).to_h
  end
end

RubyOnSpeed.report! __FILE__
