# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Object:class - test if an Object is derived from a  Class' do
  SampleClass = Class.new
  sample = Class.new(SampleClass).new

  code '#is_a?', -> { sample.is_a?(SampleClass) }
  code '#kind_of?', -> { sample.kind_of?(SampleClass) }
  code '===', -> { SampleClass === sample }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
