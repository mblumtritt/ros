# frozen_string_literal: true

require_relative 'compact_reporter'

module RubyOnSpeed
  class DefaultReporter < CompactReporter
    def start_warming
      puts(section('warmup'))
    end

    def warming(label, _warmup)
      print(rjust(label))
    end

    def warmup_stats(_warmup_time_us, timing)
      printf("%s i/100ms\n", ::Benchmark::IPS::Helpers.scale(timing))
    end

    def start_running
      puts(section('benchmark'))
    end

    alias running warming

    def add_report(report, _source)
      puts(" #{report.body}")
      super
    end

    protected

    def rjust(label)
      label = label.to_s
      label.size > 20 ? "#{label}\n#{' ' * 20}" : label.rjust(20)
    end

    def section(str)
      str = " #{str} -"
      line('-').tap { |ret| ret[-str.size, str.size] = str }
    end
  end
end
