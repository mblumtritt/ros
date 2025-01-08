# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Ruby:const_get - get a constant value' do
  module ConstGet
    CONST = 'value'

    class << self
      attr_reader :const_attr

      def const = 'value'
    end

    @const_attr = 'value'

    module Indirect
      def self.const = CONST
      def self.const_call = ConstGet.const
      def self.const_attr = ConstGet.const_attr
    end
  end

  code '::CONST' do
    ConstGet::CONST
  end

  code '.const_get(Symbol)' do
    ConstGet.const_get(:CONST)
  end

  code '.const_get(String)' do
    ConstGet.const_get('CONST')
  end

  code '.const' do
    ConstGet.const
  end

  code '.const_attr' do
    ConstGet.const_attr
  end

  code 'Indirect.const' do
    ConstGet::Indirect.const
  end

  code 'Indirect.const_call' do
    ConstGet::Indirect.const_call
  end

  code 'Indirect.const_attr' do
    ConstGet::Indirect.const_attr
  end
end
