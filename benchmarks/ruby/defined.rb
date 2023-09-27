# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Ruby:defined - const_defined' do
  sample = Module.new
  sample::MAX = 10

  code 'defined?' do
    defined?(sample::MAX)
  end

  code 'const_defined?' do
    sample.const_defined?(:MAX)
  end
end

RubyOnSpeed.report! __FILE__
