# frozen_string_literal: true

require_relative 'reporter'

module RubyOnSpeed
  class DefaultReporter < Reporter
    def bm=(value)
      puts(super(value).label)
    end

    def start(count)
      puts("run #{count} benchmarks:", nil)
    end

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

    def compare(best, others)
      puts(line)
      show_winners(best)
      show_others(best[0], others)
      puts(line, nil)
    end

    protected

    def show_others(best, others)
      others.each do |report|
        slowdown, error = report.stats.slowdown(best.stats)
        printf(
          '%20s: %10.1f i/s - %.2fx ',
          report.label,
          report.stats.central_tendency,
          slowdown
        )
        printf('(± %.2f) ', error) if error
        puts('slower')
      end
    end

    def show_winners(best)
      best.each do |report|
        line =
          format(
            '%20s: %10.1f i/s',
            report.label,
            report.stats.central_tendency
          )
        puts(line)
      end
    end

    def rjust(label)
      label = label.to_s
      label.size > 20 ? "#{label}\n#{' ' * 20}" : label.rjust(20)
    end

    def line(char = '=')
      char * 79
    end

    def section(str)
      str = " #{str} -"
      line('-').tap { |ret| ret[-str.size, str.size] = str }
    end
  end
end
