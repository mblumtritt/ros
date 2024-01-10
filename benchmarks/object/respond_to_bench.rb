# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Object:respond_to - test if object responds to' do
  test_truthy_results!

  sample =
    Class
      .new do
        def foo
          true
        end
      end
      .new

  code '#respond_to?' do
    sample.respond_to?(:foo)
  end

  code 'defined?' do
    defined?(sample.foo)
  end
end
