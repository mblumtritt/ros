# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

module SampleModule
  CONST = 'value'

  class << self
    attr_reader :const_attr

    def const = 'value'
  end

  @const_attr = 'value'

  module Indirect
    def self.const = CONST
    def self.const_call = SampleModule.const
    def self.const_attr = SampleModule.const_attr
  end
end

RubyOnSpeed.benchmark 'Ruby:const_get - get a constant value' do
  code '::CONST' do
    SampleModule::CONST
  end

  code '.const_attr' do
    SampleModule.const_attr
  end

  code '.const' do
    SampleModule.const
  end

  code 'Indirect.const' do
    SampleModule::Indirect.const
  end

  code '.const_get(Symbol)' do
    SampleModule.const_get(:CONST)
  end

  code 'Indirect.const_attr' do
    SampleModule::Indirect.const_attr
  end

  code 'Indirect.const_call' do
    SampleModule::Indirect.const_call
  end

  code '.const_get(String)' do
    SampleModule.const_get('CONST')
  end
end
