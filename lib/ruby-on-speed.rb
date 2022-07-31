# frozen_string_literal: true

module RubyOnSpeed
  Error = Class.new(StandardError)
  Skipped = Class.new(StandardError)

  require_relative('ruby-on-speed/version')
  require_relative('ruby-on-speed/register')
  require_relative('ruby-on-speed/benchmark')

  class << self
    def test(label = nil, &block)
      raise('no block given') unless block
      Register.add(Benchmark.new(label, block))
    end
    alias benchmark test
    alias check test

    def ignore; end
    alias xtest ignore

    def to_a
      Register.each.to_a
    end

    def test!
      Register.each.sum { |bm| test_benchmark(bm) ? 0 : 1 }
      true
    end

    def report!
      require_relative('ruby-on-speed/default_reporter')
      run(DefaultReporter.new)
    end

    def json_report!
      require_relative('ruby-on-speed/json_reporter')
      JSONReporter.new.then do |reporter|
        run(reporter)
        reporter.finalize
        true
      end
    end

    def find_best!
      require_relative('ruby-on-speed/progress_reporter')
      run(ProgressReporter.new)
    end

    def filter!(regexp)
      return unless regexp
      regexp = Regexp.new(regexp, Regexp::IGNORECASE)
      Register.keep_if { |name| regexp.match?(name) }
    rescue RegexpError => e
      self.action = :nop
      abort("ERROR: #{e}")
    end

    private

    def test_benchmark(bm)
      print("#{bm} ...")
      bm.test!
      puts('ok')
      true
    rescue Skipped => e
      puts("skipped - #{e}")
      true
    rescue Error => e
      $stderr.puts("error - #{e}")
      false
    end

    def run(reporter)
      return false if Register.size.zero?
      reporter.start(Register.size)
      Register.each { |bm| bm.go!(reporter) }
      true
    rescue Interrupt
      $stderr.puts(' ABORTED')
      130
    end
  end
end
