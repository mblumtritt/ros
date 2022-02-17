# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby: request_entity vs. check_method' do
  has_truthy_results!

  EntityFooInstance =
    Class.new do
      attr_reader :entity

      def initialize
        @entity = true
      end

      def entity?
        true
      end

      def foo; end
    end.new

  code 'accessor', -> { EntityFooInstance.entity }
  code 'call', -> { EntityFooInstance.entity? }
  code 'defined?', -> { defined?(EntityFooInstance.foo) }
  code 'respond_to?', -> { EntityFooInstance.respond_to?(:foo) }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
