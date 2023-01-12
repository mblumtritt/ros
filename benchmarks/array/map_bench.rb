# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array:map - modify all elements of an Array' do
  sample_array = fixture(:integers)

  code '#map' do
    sample_array.dup.map(&:to_s)
  end

  code '#map!' do
    sample_array.dup.map!(&:to_s)
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
