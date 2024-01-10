# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:last - access the last element of an Array' do
  sample = fixture(:integers)

  code '#[-1]' do
    sample[-1]
  end

  code '#last' do
    sample.last
  end
end
