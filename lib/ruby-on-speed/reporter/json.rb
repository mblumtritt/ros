# frozen_string_literal: true

require 'host-os'
require_relative 'base'

module RubyOnSpeed
  class JsonReporter < Reporter
    def suite_start(_)
      @benchmarks = []
    end

    def benchmark_start(benchmark)
      super
      @benchmarks << (
        @current = { name: benchmark.name, description: benchmark.description }
      )
    end

    def benchmark_end
      @current[:data] = @reports.map do |entry|
        {
          name: entry.label,
          central_tendency: entry.stats.central_tendency,
          error: entry.stats.error,
          microseconds: entry.microseconds,
          iterations: entry.iterations,
          cycles: entry.measurement_cycle
        }
      end
      @current = nil
      super
    end

    def suite_end
      puts(
        as_json(
          meta: {
            suite: 'RubyOnSpeed',
            version: RubyOnSpeed::VERSION,
            interpreter: HostOS.interpreter.id.to_s,
            hostOS: HostOS.id.to_s
          },
          benchmarks: @benchmarks
        )
      )
      @benchmarks = nil
    end

    private

    def as_json(obj)
      with_lib('oj') { ::Oj.dump(obj, mode: :compat) } ||
        with_lib('json') { ::JSON.dump(obj) }
    end

    def with_lib(name)
      require(name)
      yield
    rescue LoadError
      nil
    end
  end
end
