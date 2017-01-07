require_relative 'reporter'

module RubyOnSpeed
  class DefaultReporter < Reporter
    def options
      {quiet: false, suite: self}
    end

    def bm=(bm)
      $stdout.puts bm.label
      super
    end

    def start(count)
      $stdout.puts "#{NAME} on Ruby v#{RUBY_VERSION} performs #{count} tests", nil
    end

    def warming_start
      $stdout.puts '--------------------------------------------------- warmup -'.freeze
    end

    def run_start
      $stdout.puts '------------------------------------------------ benchmark -'.freeze
    end

    def compare(best, others)
      $stdout.puts '-' * 60
      super
      $stdout.puts '=' * 60, nil
    end
  end
end
