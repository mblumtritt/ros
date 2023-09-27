# frozen_string_literal: true

# frozen_string_literal: true

require 'host-os'
require_relative 'base'

module RubyOnSpeed
  class WinnerReporter < CompetitionReporter
    def suite_start(_benchmark_count)
      puts(
        "RubyOnSpeed v#{RubyOnSpeed::VERSION} for " \
          "#{HostOS.interpreter} v#{RUBY_VERSION} on " \
          "#{HostOS}"
      )
    end

    def benchmark_start(benchmark)
      super
      print("  • #{benchmark.label}: ")
    end

    def progress(*_)
      print('•')
    end

    alias start_warming progress
    alias warming progress
    alias warmup_stats progress
    alias start_running progress
    alias running progress
    alias running_report progress

    def winner_result(name, _tendency)
      puts(" #{name}")
    end

    def other_result(_name, _tendency, _slowdown, _error)
      # nop
    end

    def interrupted!
      $stderr.puts(' ABORTED')
    end
  end
end
