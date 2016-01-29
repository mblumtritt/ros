require_relative 'reporter'

module RubyOnSpeed
  class TableReporter < Reporter
    def options
      {quiet: true, suite: self}
    end

    def start(size)
      $stdout.puts "#{NAME} on Ruby v#{RUBY_VERSION} performs #{size} tests:", nil
    end

    def compare(best, others)
      $stdout.printf "%20s: %10.1f i/s\n", best.label, best.ips
      super
      $stdout.puts nil
    end
  end
end
