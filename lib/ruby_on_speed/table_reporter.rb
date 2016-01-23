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
      others.each do |report|
        name = report.label
        x = (best.ips.to_f / report.ips.to_f)
        $stdout.printf "%20s: %10.1f i/s - %.2fx slower\n", name, report.ips, x
      end
      $stdout.puts nil
    end
  end
end
