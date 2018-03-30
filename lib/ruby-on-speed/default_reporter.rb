# frozen_string_literal: true

require_relative 'reporter'

module RubyOnSpeed
  class DefaultReporter < Reporter
    def options
      {quiet: false, suite: self}
    end

    def bm=(bm)
      puts(bm.label)
      super
    end

    def start(count)
      puts("#{NAME} on Ruby v#{RUBY_VERSION} performs #{count} tests", nil)
    end

    def warming_start
      puts('---------------------------------------------------------------------- warmup -')
    end

    def run_start
      puts('------------------------------------------------------------------- benchmark -')
    end

    def compare(best, others)
      puts('=' * 79)
      super
      puts('=' * 79, nil)
    end
  end
end
