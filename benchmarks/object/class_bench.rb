# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark(
  'Object:class - test if an Object is derived from a  Class'
) do
  sample_class = Class.new
  sample = Class.new(sample_class).new

  code '#is_a?' do
    sample.is_a?(sample_class)
  end

  code '#kind_of?' do
    sample.kind_of?(sample_class)
  end

  code '===' do
    sample_class === sample
  end
end

RubyOnSpeed.report! __FILE__
