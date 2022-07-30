# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array:compact - remove any nil element from an Array' do
  sample_array = (Array.new(1000, &:itself) + Array.new(1000)).shuffle!.freeze

  code '#compact!' do
    ret = Array.new(sample_array)
    ret.compact!
    ret
  end

  code '#reject!' do
    ret = Array.new(sample_array)
    ret.reject!(&:nil?)
    ret
  end

  code '#delete_if' do
    ret = Array.new(sample_array)
    ret.delete_if(&:nil?)
    ret
  end

  code '#delete' do
    ret = Array.new(sample_array)
    ret.delete(nil)
    ret
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
