require_relative 'reporter'

module RubyOnSpeed
  class TableReporter < Reporter
    def options
      {quiet: true, suite: self}
    end

    def start(size)
      puts "#{NAME} on Ruby v#{RUBY_VERSION} performs #{size} tests:", nil
    end

    def compare(best, others)
      printf "%20s: %10.1f i/s\n", best.label, best.ips
      super
      puts nil
    end
  end
end
