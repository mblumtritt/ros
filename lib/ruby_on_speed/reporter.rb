module RubyOnSpeed
  autoload :DefaultReporter, "#{__dir__}/default_reporter"
  autoload :ProgressReporter, "#{__dir__}/progress_reporter"
  autoload :TableReporter, "#{__dir__}/table_reporter"

  class Reporter
    def self.create(type)
      name = "#{type.to_s.capitalize}Reporter"
      raise("unknown reporter - #{type}") unless RubyOnSpeed.const_defined?(name)
      RubyOnSpeed.const_get(name).new
    end

    attr_reader :jobs

    def initialize
      @current_bm, @bms = nil, {}
    end

    def options
      {quiet: true, suite: self}
    end

    def bm=(bm)
      @current_bm = @bms[bm.label] = []
    end

    def nop(*_)
      # NOP
    end

    alias start nop
    alias warming_start nop
    alias warming nop
    alias warmup_stats nop
    alias run_start nop
    alias running nop
    alias compare nop

    def add_report(report, _source)
      @current_bm << report
    end

    def report
      sorted = @current_bm.sort{ |a, b| b.ips <=> a.ips }
      compare(sorted.shift, sorted)
      @current_bm = nil
    end

    protected

    def compare(best, others)
      printf "%20s: %10.1f i/s\n", best.label, best.ips
      others.each do |report|
        name = report.label
        x = (best.ips.to_f / report.ips.to_f)
        printf "%20s: %10.1f i/s - %.2fx slower\n", name, report.ips, x
      end
    end
  end
end
