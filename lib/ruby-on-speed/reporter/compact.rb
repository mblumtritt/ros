# frozen_string_literal: true

require 'host-os'
require_relative 'base'

module RubyOnSpeed
  class CompactReporter < CompetitionReporter
    def suite_start(_benchmark_count)
      puts(
        ">> RubyOnSpeed v#{RubyOnSpeed::VERSION} for " \
          "#{HostOS.interpreter} v#{RUBY_VERSION} on " \
          "#{HostOS}"
      )
    end

    def benchmark_start(benchmark)
      super
      print("> #{benchmark.label}:")
    end

    def start_result
      @width = @reports.max_by { |r| r.label.size }.label.size + 3
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

    def scaled(value)
      value = value.to_f
      scale = (Math.log10(value) / 3).to_i
      suffix = ' kMBTQ'[scale] || ' '
      scale = 0 if scale == 0 || scale > 5
      format("%6.3f#{suffix}", value / (1000**scale))
    end
  end
end
