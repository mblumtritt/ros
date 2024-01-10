# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:first - access the first element of an Array' do
  sample = fixture(:integers)

  code '#[0]' do
    sample[0]
  end

  code '#first' do
    sample.first
  end
end
