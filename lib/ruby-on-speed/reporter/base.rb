# frozen_string_literal: true

require 'host-os'

module RubyOnSpeed
  class Reporter
    attr_reader :info

    def setup(info)
      @info = info
      puts("🔻 #{info.details}", nil)
    end

    def teardown
      @info = nil
    end

    def interrupted
      $stderr.puts(' ABORTED')
    end

    protected

    # size = 19
    def instruction_per_mill(timing)
      "#{scaled(timing)} i/100ms"
    end

    # size = 24
    def instruction_per_second(timing, error_percent)
      "#{scaled(timing)} (±#{format('%4.1f%%', error_percent)}) i/s"
    end

    # size = 30
    def tendency(tendency, slowdown)
      "#{scaled(tendency)} i/s - #{format('%.2f', slowdown)}x slower"
    end

    def scaled(value)
      value = value.to_f
      scale = (Math.log10(value) / 3).to_i
      format(
        "%10.3f#{' kMBTQ'[scale] || ' '}",
        scale == 0 || scale > 5 ? value : value / (1000**scale)
      )
    end
  end

  class ReportFacade
    SuiteInfo =
      Struct.new(:benchmarks, :benchmark, :test) do
        def details
          str =
            "RubyOnSpeed v#{RubyOnSpeed::VERSION} for #{
              HostOS.interpreter
            } v#{RUBY_VERSION} on #{HostOS}"
          return str unless HostOS.interpreter.jit_enabled?
          str + " using #{HostOS.interpreter.jit_type.upcase}"
        end
      end

    TestInfo = Struct.new(:name, :warmup_timing, :stats)

    def initialize(benchmarks, reporter)
      @info = SuiteInfo.new(benchmarks.names)
      @reporter = reporter
    end

    def suite_start
      @reporter.setup(@info)
    end

    def benchmark_start(benchmark)
      @info.benchmark = benchmark
      @reporter.start if defined?(@reporter.start)
    end

    def start_warming
      @reporter.warming_start if defined?(@reporter.warming_start)
    end

    def warming(name, _warming_rounds)
      @info.test = TestInfo.new(name)
      @reporter.test_warming_start if defined?(@reporter.test_warming_start)
    end

    def warmup_stats(_warmup_time_us, timing)
      return unless defined?(@reporter.test_warming_end)
      @info.test.warmup_timing = timing
      @reporter.test_warming_end
    end

    def start_running
      @info.test = nil
      @reporter._warming_end if defined?(@reporter.warming_end)
      @test_reports = []
      @reporter.running_start if defined?(@reporter.running_start)
    end

    def running(name, _run_time)
      @info.test = TestInfo.new(name)
      @reporter.test_run_start if defined?(@reporter.test_run_start)
    end

    def add_report(report, _caller)
      @test_reports << report
      return unless defined?(@reporter.test_run_end)
      @info.test.stats = report.stats
      @reporter.test_run_end
    end

    def footer
      @info.test = nil
      @reporter.running_end if defined?(@reporter.running_end)
      unless @test_reports.empty?
        @test_reports.sort_by! { _1.stats.central_tendency }.reverse!
        @reporter.raw_results(@test_reports) if defined?(@reporter.raw_results)
        report_results if defined?(@reporter.results)
      end
      @test_reports = nil
    end

    def suite_end
      @info.benchmark = nil
      @reporter.teardown if defined?(@reporter.teardown)
      @info = nil
    end

    def interrupted!
      @reporter.interrupted if defined?(@reporter.interrupted)
    end

    private

    def report_results
      top = @test_reports.first
      best, other = @test_reports.partition { _1.stats.overlaps?(top.stats) }
      @reporter.results(
        best.to_h { [_1.label, _1.stats.central_tendency] },
        other.to_h do |report|
          [
            report.label,
            [report.stats.central_tendency, report.stats.slowdown(top.stats)[0]]
          ]
        end
      )
    end
  end
end
