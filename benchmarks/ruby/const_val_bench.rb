# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

module SampleMod
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

RubyOnSpeed.benchmark 'Ruby:const - const value access' do
  sample_module = SampleMod.create_mod(21)
  sample_instane = SampleMod::Test.new(21)

  code 'instance' do
    sample_instane.value
  end

  code 'module' do
    sample_module.value
  end
end
