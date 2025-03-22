# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

SampleBaseClass = Class.new
SampleClass = Class.new(SampleBaseClass)

RubyOnSpeed.benchmark(
  'Object:class - test if an Object is derived from a  Class'
) do
  object = SampleClass.new

  code '#is_a?' do
    object.is_a?(SampleClass)
  end

  code '===' do
    SampleClass === object
  end
  code '#kind_of?' do
    object.kind_of?(SampleClass)
  end
end
