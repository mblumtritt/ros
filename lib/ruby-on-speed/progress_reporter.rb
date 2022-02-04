# frozen_string_literal: true

require_relative 'reporter'

module RubyOnSpeed
  class ProgressReporter < Reporter
    def bm=(value)
      print("#{super(value).label} ")
    end

    def start(count)
      puts("#{NAME} on Ruby v#{RUBY_VERSION} performs #{count} tests", nil)
    end

    def dot(*_)
      print('.')
    end

    def warmup_stats(_time, _ips)
      dot(super)
    end

    def running(_name, _count)
      dot(super)
    end

    def add_report(_report, _source)
      dot(super)
    end

    def compare(best, _others)
      puts("ok - fastest: #{best.label}")
    end
  end
end
