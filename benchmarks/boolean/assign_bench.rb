# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Boolean:assign - assign value' do
  has_boolean_results!
  samples = [false, true, nil, 1, Object.new].freeze

  code '!!value' do
    !!samples.sample
  end

  code 'value=' do
    samples.sample ? true : false
  end
end

RubyOnSpeed.report! __FILE__
