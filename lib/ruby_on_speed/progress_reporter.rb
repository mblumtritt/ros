require_relative 'reporter'

module RubyOnSpeed
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
