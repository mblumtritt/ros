# frozen_string_literal: true

module RubyOnSpeed
  class Reporter
    attr_reader :jobs

    def initialize
      @current_bm, @bms = nil, {}
    end

    def options
      { quiet: true, suite: self }
    end

    def bm=(value)
      @current_bm = @bms[value.label] = []
    end

    def nop(*_); end
    alias start nop
    alias warming_start nop
    alias warming nop
    alias warmup_stats nop
    alias run_start nop
    alias running nop

    def add_report(report, _source)
      @current_bm << report
    end

    def report
      sorted = @current_bm.sort_by(&:ips).reverse!
      compare(sorted.shift, sorted)
      @current_bm = nil
    end

    protected

    def compare(best, others)
      puts(format('%20s: %10.1f i/s', best.label, best.ips))
      others.each do |report|
        puts(
          format(
            '%20s: %10.1f i/s - %.2fx slower',
            report.label,
            report.ips,
            (best.ips.to_f / report.ips)
          )
        )
      end
    end
  end
end
