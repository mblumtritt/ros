# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby:method_call - calling methods' do
  class SampleBase
    def self.call(num)
      21 + num
    end

    def call(num)
      21 + num
    end

    define_method(:defined_call) { |num| 21 + num }
    eval('def evaled_call(num); 21 + num; end')
  end

  class SampleChild < SampleBase
  end

  class SampleOverride < SampleBase
    def call(num)
      super
    end

    def defined_call(num)
      super
    end

    def evaled_call(num)
      super
    end
  end

  module SampleMixin
    def call(num)
      21 + num
    end
  end

  class SampleWithMixin
    include SampleMixin
  end

  sample_base = SampleBase.new
  sample_child = SampleChild.new
  sample_override = SampleOverride.new
  sample_with_mixin = SampleWithMixin.new
  sample_proc = proc { |num| 21 + num }
  sample_lambda = ->(num) { 21 + num }
  sample_unbound = sample_base.method(:call)
  sample_class_unbound = SampleBase.method(:call)

  code 'class method call' do
    SampleBase.call(21)
  end

  code 'method call' do
    sample_base.call(21)
  end
  code 'defined method call' do
    sample_base.defined_call(21)
  end
  code 'evaled method call' do
    sample_base.evaled_call(21)
  end

  code 'child method call' do
    sample_child.call(21)
  end
  code 'child defined method call' do
    sample_child.defined_call(21)
  end
  code 'child evaled method call' do
    sample_child.evaled_call(21)
  end

  code 'override method call' do
    sample_override.call(21)
  end
  code 'override defined method call' do
    sample_override.defined_call(21)
  end
  code 'override evaled method call' do
    sample_override.evaled_call(21)
  end

  code 'mixin method call' do
    sample_with_mixin.call(21)
  end

  code 'proc call' do
    sample_proc.call(21)
  end
  code 'lambda call' do
    sample_lambda.call(21)
  end

  code 'unbound method call' do
    sample_unbound.call(21)
  end
  code 'unbound class method call' do
    sample_class_unbound.call(21)
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
