module RubyOnSpeed
  autoload :DefaultReporter, "#{__dir__}/default_reporter"
  autoload :ProgressReporter, "#{__dir__}/progress_reporter"
  autoload :TableReporter, "#{__dir__}/table_reporter"

  class Reporter
    def self.create(type)
      name = "#{type.to_s.capitalize}Reporter"
      RubyOnSpeed.const_defined?(name) ? RubyOnSpeed.const_get(name).new : raise("unknown reporter - #{type}")
    end

    attr_reader :jobs

    def initialize
      @current_bm = nil
      @bms = {}
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
  end
end
