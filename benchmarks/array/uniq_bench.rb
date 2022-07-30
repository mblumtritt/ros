# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array:unique - remove all duplicate from an Array' do
  sample_elements = Array.new(500) { Object.new }
  sample_array = (sample_elements + sample_elements).shuffle!.freeze

  code 'uniq' do
    sample_array.uniq
  end

  code 'copy#uniq!' do
    ret = Array.new(sample_array)
    ret.uniq!
    ret
  end

  code 'hashing1' do
    sample_array.map { |e| [e, true] }.to_h.keys
  end

  code 'hashing2' do
    h = {}
    sample_array.each { |e| h[e] = 1 }
    h.keys
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
