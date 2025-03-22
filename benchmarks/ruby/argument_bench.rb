# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Object:method_argument - test (default) arguments' do
  def val
    21
  end

  def simple(arg1, arg2)
    arg1 + arg2
  end

  def default(arg1 = val, arg2 = val)
    arg1 + arg2
  end

  def kwdefault(arg1: val, arg2: val)
    arg1 + arg2
  end

  def nil_default(arg1 = nil, arg2 = nil)
    (arg1 || val) + (arg2 || val)
  end

  code 'simple' do
    simple(val, val)
  end

  code 'default' do
    default
  end

  code 'kwdefault' do
    kwdefault
  end

  code 'nil_default' do
    nil_default
  end
end
