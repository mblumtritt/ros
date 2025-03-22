# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:compact - remove all nil elements from an Array' do
  array = (Array.new(40, 1) + Array.new(10)).shuffle!.freeze

  code '#compact' do
    Array.new(array).compact
  end

  code '#compact!' do
    ret = Array.new(array)
    ret.compact!
    ret
  end

  code '#delete_if' do
    Array.new(array).delete_if(&:nil?)
  end

  code '#filter_map' do
    Array.new(array).filter_map { _1 }
  end

  code '#reject!' do
    ret = Array.new(array)
    ret.reject!(&:nil?)
    ret
  end

  code '#delete' do
    ret = Array.new(array)
    ret.delete(nil)
    ret
  end
end
