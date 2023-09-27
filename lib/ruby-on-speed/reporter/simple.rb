# frozen_string_literal: true

require 'host-os'
require_relative 'default'

module RubyOnSpeed
  class SimpleReporter < DefaultReporter
    def suite_start(_benchmark_count)
      puts(
        '=' * 79,
        " RubyOnSpeed v#{RubyOnSpeed::VERSION} for " \
          "#{HostOS.interpreter} v#{RUBY_VERSION} on " \
          "#{HostOS}"
      )
    end

    def benchmark_start(benchmark)
      @reports = []
      puts('=' * 79, " #{benchmark.label}")
    end

    def start_result
      puts('=' * 79)
    end

    def end_result
      puts('=' * 79, nil)
    end

    protected

    def section(str)
      puts("#{'-' * (75 - str.size)} #{str} --")
    end

    def left_part(str)
      if str.size > 38
        puts(" #{str}")
        print(' ' * 38)
      else
        print("#{str.rjust(38)}")
      end
    end

    def right_part(str)
      puts(str)
    end
  end
end
