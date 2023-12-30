# frozen_string_literal: true

require 'host-os'
require_relative 'base'

module RubyOnSpeed
  class CompactReporter < CompetitionReporter
    def suite_start(_benchmark_count)
      str =
        "RubyOnSpeed v#{RubyOnSpeed::VERSION} for " \
          "#{HostOS.interpreter} v#{RUBY_VERSION} on #{HostOS}"
      if HostOS.interpreter.jit_enabled?
        str += " using #{HostOS.interpreter.jit_type.upcase}"
      end
      puts(str, nil)
    end

    def benchmark_start(benchmark)
      super
      print("• #{benchmark.label}:")
    end

    def start_result
      @width = @reports.max_by { |r| r.label.size }.label.size + 2
      puts
    end

    def winner_result(name, tendency)
      puts("#{name.rjust(@width)}: #{scaled(tendency)} i/s")
    end

    def other_result(name, tendency, slowdown, error)
      puts("#{name.rjust(@width)}: #{tendency(tendency, slowdown, error)}")
    end

    def end_result
      puts
    end

    def interrupted!
      $stderr.puts(' ABORTED')
    end
  end
end
