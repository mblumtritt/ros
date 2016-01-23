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

    def start(size)
      $stdout.puts "#{NAME} on Ruby v#{RUBY_VERSION} performs #{size} tests", nil
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
end
