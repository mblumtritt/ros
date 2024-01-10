# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Boolean:assign - assign value' do
  test_boolean_results!
  samples = [false, true, nil, 1, Object.new].freeze

  code '!!value' do
    !!samples.sample
  end

  code '? true : false' do
    samples.sample ? true : false
  end
end
