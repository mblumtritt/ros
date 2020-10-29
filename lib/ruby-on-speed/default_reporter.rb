# frozen_string_literal: true

require_relative 'reporter'

module RubyOnSpeed
  class DefaultReporter < Reporter
    def options
      { quiet: false, suite: self }
    end

    def bm=(bm)
      puts(bm.label)
      super
    end

    def start(count)
      puts("#{NAME} on Ruby v#{RUBY_VERSION} performs #{count} tests", nil)
    end

    def warming_start
      puts(section('warmup'))
    end

    def run_start
      puts(section('benchmark'))
    end

    def compare(best, others)
      puts(line)
      super
      puts(line, nil)
    end

    protected

    def line(char = '=')
      char * 79
    end

    def section(str)
      str = " #{str} -"
      line('-').tap{ |ret| ret[-str.size, str.size] = str }
    end
  end
end
