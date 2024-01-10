# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:compact - remove all nil elements from an Array' do
  sample = (Array.new(40, 1) + Array.new(10)).shuffle!.freeze!

  code '#compact' do
    Array.new(sample).compact
  end

  code '#compact!' do
    ret = Array.new(sample)
    ret.compact!
    ret
  end

  code '#reject!' do
    ret = Array.new(sample)
    ret.reject!(&:nil?)
    ret
  end

  code '#delete_if' do
    Array.new(sample).delete_if(&:nil?)
  end

  code '#delete' do
    ret = Array.new(sample)
    ret.delete(nil)
    ret
  end
end
