# frozen_string_literal: true

module RubyOnSpeed
  class Reporter
    def bm=(value)
      @entries = []
      @bm = value
    end

    def nop
      # nop
    end

    %i[
      start_warming
      warming
      warmup_stats
      start_running
      start
      running
    ].each { |name| define_method(name) { |*_| nop } }

    def add_report(report, _source)
      @entries << report
    end

    def run_comparison
      sorted = @entries.sort_by { |e| e.stats.central_tendency }.reverse
      best = [sorted.shift]
      while !sorted.empty? && sorted[0].stats.overlaps?(best[0].stats)
        best << sorted.shift
      end
      compare(best, sorted)
    end

    def compare(_best, _sorted)
      raise(NotImplementedError)
    end
  end
end
