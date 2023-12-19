# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Ruby:const_get - get a constant value' do
  module ConstGet
    VALUE = 'value'
  end

  code '::CONST' do
    ConstGet::VALUE
  end

  code '.const_get(Symbol)' do
    ConstGet.const_get(:VALUE)
  end

  code '.const_get(String)' do
    ConstGet.const_get('VALUE')
  end
end

RubyOnSpeed.report! __FILE__
