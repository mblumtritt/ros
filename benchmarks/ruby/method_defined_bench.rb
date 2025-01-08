# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Ruby:defined - method_defined' do
  test_truthy_results!

  sample =
    Module.new do
      def self.foo
        nil
      end
    end

  code 'defined?' do
    defined?(sample.foo)
  end

  code 'method_defined?' do
    sample.method_defined?(:foo)
  end
end
