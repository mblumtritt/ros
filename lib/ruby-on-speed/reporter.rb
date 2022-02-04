# frozen_string_literal: true

module RubyOnSpeed
  class Reporter
    attr_reader :jobs

    def options
      { quiet: true, suite: nil }
    end

    def bm=(value)
      @entries = []
      @bm = value
    end

    def nop(*_); end
    alias start nop
    alias start_warming nop
    alias warming nop
    alias warmup_stats nop
    alias start_running nop
    alias running nop
    alias footer nop

    def add_report(report, _source)
      @entries << report
    end

    def run_comparison
      sorted = @entries.sort_by { |e| e.stats.central_tendency }.reverse
      compare(sorted.shift, sorted)
    end

    protected

    def compare(best, others)
      puts(format('%20s: %10.1f i/s', best.label, best.stats.central_tendency))
      others.each do |report|
        line =
          format(
            '%20s: %10.1f i/s - ',
            report.label,
            report.stats.central_tendency
          )
        if report.stats.overlaps?(best.stats)
          next puts("#{line}same-ish: difference falls within error")
        end
        slowdown, error = report.stats.slowdown(best.stats)
        line << format('%.2fx ', slowdown)
        line << format(' (± %.2f)', error) if error
        puts("#{line} slower")
      end
      footer = best.stats.footer
      puts(footer.rjust(40)) if footer
    end
  end
end
