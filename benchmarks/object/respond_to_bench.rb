# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Object:respond_to - test if object responds to' do
  test_truthy_results!

  object =
    Class
      .new do
        def foo
          true
        end
      end
      .new

  code 'defined?' do
    defined?(object.foo)
  end

  code '#respond_to?' do
    object.respond_to?(:foo)
  end
end
