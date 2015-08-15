module RubyOnSpeed
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

  class DefaultReporter < Reporter
    def options
      {quiet: false, suite: self}
    end

    def bm=(bm)
      $stdout.puts bm.label
      super
    end

    def start(size)
      $stdout.puts "#{NAME} performs #{size} tests", ''
    end

    def warming_start
      $stdout.puts '--------------------------------------------------- warmup -'.freeze
    end

    def run_start
      $stdout.puts '------------------------------------------------ benchmark -'.freeze
    end

    def compare(best, others)
      $stdout.puts '-' * 60
      $stdout.printf "%20s: %10.1f i/s\n", best.label, best.ips
      others.each do |report|
        name = report.label
        x = (best.ips.to_f / report.ips.to_f)
        $stdout.printf "%20s: %10.1f i/s - %.2fx slower\n", name, report.ips, x
      end
      $stdout.puts '=' * 60, nil
    end
  end

  class ProgressReporter < Reporter
    def bm=(bm)
      $stdout.print "#{bm.label} "
      super
    end

    def start(size)
      $stdout.puts "#{NAME} performs #{size} tests:"
    end

    def dot(*_)
      $stdout.print '.'
    end

    def warmup_stats(_time, ips)
      dot super
    end

    def running(_name, _count)
      dot super
    end

    def add_report(_report, _source)
      dot super
    end

    def compare(best, others)
      $stdout.puts "ok - fastest: #{best.label}"
    end
  end
end
