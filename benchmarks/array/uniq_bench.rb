# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array: unique values' do
  sample_array = Array.new(1000) { Object.new }
  (sample_array += sample_array).freeze

  code 'uniq' do
    sample_array.uniq
  end

  code 'copy#uniq!' do
    ret = Array.new(sample_array)
    ret.uniq!
    ret
  end

  code 'use hash' do
    sample_array.map { |e| [e, true] }.to_h.keys
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
