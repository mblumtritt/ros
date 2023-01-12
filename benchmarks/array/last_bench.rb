# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array:last - access the last element of an Array' do
  sample_array = fixture(:integers)

  code '#[-1]' do
    sample_array[-1]
  end

  code '#last' do
    sample_array.last
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
