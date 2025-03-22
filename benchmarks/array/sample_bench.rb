# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:sample - get a random element of an Array' do
  test_by_type!

  array = (0..999).to_a.freeze
  size = array.size

  code '#sample' do
    array.sample
  end

  code '#[rand]' do
    array[Random.rand(size)]
  end

  code '#shuffle[0]' do
    array.shuffle[0]
  end
end
