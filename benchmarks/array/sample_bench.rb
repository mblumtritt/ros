# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:sample - get a random element of an Array' do
  test_by_type!

  sample = fixture(:integers)
  sample_max = sample.size - 1

  code '#sample' do
    sample.sample
  end

  code '#[rand]' do
    sample[Random.rand(sample.size - 1)]
  end

  code '#[rand2]' do
    sample[Random.rand(sample_max)]
  end

  code '#shuffle[0]' do
    sample.shuffle[0]
  end
end
