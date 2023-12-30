# frozen_string_literal: true

module RubyOnSpeed
  class Reporter
    # at the start of the suite
    def suite_start(_benchmark_count)
      # nop
    end

    # before each benchmark
    def benchmark_start(_benchmark)
      @reports = []
    end

    # warming starts
    def start_warming
      # nop
    end

    # at warming
    def warming(_name, _warming_rounds)
      # nop
    end

    # statistic for warming
    def warmup_stats(_warmup_time_us, _timing)
      # nop
    end

    # run starts
    def start_running
      # nop
    end

    # at running
    def running(_name, _run_time)
      # nop
    end

    # at run result avail
    def add_report(report, _source)
      @reports << report
      running_report(report)
    end

    def running_report(report)
      # nop
    end

    # at end of a benchmark run
    def footer
      sorted = @reports.sort_by { |e| e.stats.central_tendency }.reverse
      best = [sorted.shift]
      while !sorted.empty? && sorted[0].stats.overlaps?(best[0].stats)
        best << sorted.shift
      end
      compare(best, sorted)
      benchmark_end
    end

    # present results
    def compare(_best, _sorted)
      # nop
    end

    # at benchmark end
    def benchmark_end
      @reports = nil
    end

    # at suite end
    def suite_end
      # nop
    end

    # whenever interrupted
    def interrupted!
      # nop
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

    # size = 25
    def iterations_per_seconds(iterations, runtime)
      "#{scaled(iterations)} in #{format('%9.6f', runtime)}s"
    end

    # size = 30
    def tendency(tendency, slowdown, error)
      "#{scaled(tendency)} i/s - #{format('%.2f', slowdown)}x#{
        format(' (± %.2f%%)', error) if error
      } slower"
    end

    def scaled(value)
      value = value.to_f
      scale = (Math.log10(value) / 3).to_i
      suffix = ' kMBTQ'[scale] || ' '
      format(
        "%10.3f#{suffix}",
        scale == 0 || scale > 5 ? value : value / (1000**scale)
      )
    end
  end

  class CompetitionReporter < Reporter
    def compare(best, others)
      start_result
      best.each do |report|
        winner_result(report.label, report.stats.central_tendency)
      end
      others.each do |report|
        other_result(
          report.label,
          report.stats.central_tendency,
          *report.stats.slowdown(best[0].stats)
        )
      end
      end_result
    end

    # result starts
    def start_result
      # nop
    end

    # result for winner
    def winner_result(_name, _tendency)
      raise(NotImplementedError)
    end

    # result for other
    def other_result(_name, _tendency, _slowdown, _error)
      raise(NotImplementedError)
    end

    # result end
    def end_result
      # nop
    end
  end
end
