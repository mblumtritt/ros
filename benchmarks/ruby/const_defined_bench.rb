# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

module SampleModule
  MAX = 42
end

RubyOnSpeed.benchmark 'Ruby:defined - const_defined' do
  test_boolean_results!

  code 'defined?' do
    defined?(SampleModule::MAX)
  end

  code 'const_defined?' do
    SampleModule.const_defined?(:MAX)
  end
end
