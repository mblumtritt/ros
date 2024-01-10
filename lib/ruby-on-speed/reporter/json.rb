# frozen_string_literal: true

require_relative 'base'

module RubyOnSpeed
  class JsonReporter < Reporter
    def setup(info)
      @info = info
      @benchmarks = []
    end

    def raw_results(reports)
      top = reports.first
      @benchmarks << {
        'name' => info.benchmark.name,
        'description' => info.benchmark.description,
        'data' =>
          reports.map do |report|
            {
              'name' => report.label,
              'central_tendency' => report.stats.central_tendency,
              'slowdown' => report.stats.slowdown(top.stats)[0],
              'error' => report.stats.error,
              'iterations' => report.iterations,
              'microseconds' => report.microseconds,
              'cycles' => report.measurement_cycle
            }
          end
      }
    end

    def teardown
      puts(
        as_json(
          'meta' => {
            'suite' => 'RubyOnSpeed',
            'version' => RubyOnSpeed::VERSION,
            'interpreter' => HostOS.interpreter.id.to_s,
            'hostOS' => HostOS.id.to_s,
            'jit' => HostOS.interpreter.jit_type.to_s
          },
          'benchmarks' => @benchmarks
        )
      )
      @benchmarks = nil
      super
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
