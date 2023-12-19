# frozen_string_literal: true

require 'host-os'
require_relative 'base'

module RubyOnSpeed
  class DefaultReporter < CompetitionReporter
    def suite_start(_benchmark_count)
      str =
        "RubyOnSpeed v#{RubyOnSpeed::VERSION} for " \
          "#{HostOS.interpreter} v#{RUBY_VERSION} on #{HostOS}"
      if HostOS.interpreter.jit_enabled?
        str = "#{str} using #{HostOS.interpreter.jit_type.upcase}"
      end
      title(str)
    end

    def benchmark_start(benchmark)
      super
      str = benchmark.label
      puts("╭#{'─' * 77}╮", "│ ⚙︎ #{str}#{' ' * (74 - str.size)}│")
    end

    def start_warming
      section('warmup')
    end

    def warming(name, _warming_rounds)
      left_part("#{name}:")
    end

    def warmup_stats(_warmup_time_us, timing)
      right_part(instruction_per_mill(timing))
    end

    def start_running
      section('benchmark')
    end

    def running_report(report)
      left_part("#{report.label}:")
      right_part(
        instruction_per_second(
          report.stats.central_tendency,
          report.stats.error_percentage
        )
      )
    end

    def start_result
      puts("╞#{'═' * 68} result ═╡")
    end

    def winner_result(name, tendency)
      left_part("#{name}:")
      right_part("#{scaled(tendency)} i/s")
    end

    def other_result(name, tendency, slowdown, error)
      left_part("#{name}:")
      right_part(tendency(tendency, slowdown, error))
    end

    def end_result
      puts("╰#{'─' * 77}╯", nil)
    end

    protected

    def title(str)
      puts("┏#{'━' * 77}┓")
      puts("┃ 🔻 #{str}#{' ' * (73 - str.size)}┃")
      puts("┗#{'━' * 77}┛", nil)
    end

    def section(str)
      puts("├#{'─' * (74 - str.size)} #{str} ─┤")
    end

    def left_part(str)
      if str.size > 38
        puts("│ #{str}#{' ' * (75 - str.size)} │")
        print("│ #{' ' * 36}")
      else
        print("│ #{str.rjust(36)}")
      end
    end

    def right_part(str)
      puts("#{str}#{' ' * (40 - str.size)}│")
    end
  end
end
