# frozen_string_literal: true

module RubyOnSpeed
  module Fixtures
    @fixtures = {}

    def self.names
      @fixtures.keys
    end

    def self.[](name)
      ret = @fixtures[name.to_s]
      raise(ArgumentError, "undefined Fixture - #{name}") if ret.nil?
      ret.is_a?(Proc) ? ret.call.freeze : ret
    end

    def self.[]=(name, value)
      @fixtures[name.to_s] = value.freeze
    end

    def self.add(name, value = nil, &block)
      @fixtures[name.to_s] = value.nil? ? block : value.freeze
    end
  end
end
