# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array:sample - get a random element of an Array' do
  has_random_results!

  sample_array = Array.new(1000, &:itself).freeze
  sample_array_max = sample_array.size - 1

  code '#sample' do
    sample_array.sample
  end

  code '#[rand]' do
    sample_array[Random.rand(sample_array.size - 1)]
  end

  code '#[rand2]' do
    sample_array[Random.rand(sample_array_max)]
  end

  code '#shuffle[0]' do
    sample_array.shuffle[0]
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
