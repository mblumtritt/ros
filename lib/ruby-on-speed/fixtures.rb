# frozen_string_literal: true

module RubyOnSpeed
  module Fixtures
    @fixtures = {}

    def self.defined
      @fixtures.keys
    end

    def self.[](name)
      @fixtures.fetch(name.to_s) do
        raise(ArgumentError, "undefined Fixture - #{name}")
      end
    end

    def self.[]=(name, value)
      @fixtures[name.to_s] = value.freeze
    end
  end
end
