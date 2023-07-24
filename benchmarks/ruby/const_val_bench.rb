# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby:const - const access' do
  module ConstTest
    def self.create_mod(value)
      Module.new { define_singleton_method(:value) { value + value } }
    end

    class Test
      def initialize(value)
        @value = value
      end

      def value
        @value + @value
      end
    end
  end

  TestMod = ConstTest.create_mod(21)
  test = ConstTest::Test.new(21)

  code 'module' do
    TestMod.value
  end

  code 'instance' do
    test.value
  end
end

RubyOnSpeed.report! __FILE__
