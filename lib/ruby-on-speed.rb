# frozen_string_literal: true

module RubyOnSpeed
  NAME = name.freeze
  Error = Class.new(RuntimeError)
  Skipped = Class.new(RuntimeError)

  require_relative('ruby-on-speed/version')
  require_relative('ruby-on-speed/register')
  require_relative('ruby-on-speed/benchmark')

  class << self
    def test(label = nil, &block)
      raise('no block given') unless block
      bm = Benchmark.new(label)
      bm.instance_exec(&block)
      Register.add(bm)
    end
    alias benchmark test
    alias check test

    def nop!
      # empty method - just to ignore a block
    end
    alias ignore nop!
    alias xtest nop!
    alias _test nop!

    def names
      Register.names
    end

    def test!
      errors = 0
      Register.each{ |bm| errors += 1 unless test_benchmark(bm) }
      errors
    end

    def report!
      require_relative('ruby-on-speed/default_reporter')
      run(DefaultReporter.new)
    end

    def find_best!
      require_relative('ruby-on-speed/progress_reporter')
      run(ProgressReporter.new)
    end

    def filter!(regexp)
      return unless regexp
      regexp = Regexp.new(regexp)
      Register.keep_if{ |name| regexp.match?(name) }
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
      entries = Register.size
      return false if entries.zero?
      reporter.start(entries)
      Register.each{ |bm| bm.go!(reporter) }
      true
    rescue Interrupt
      $stderr.puts(' ABORTED')
    end
  end
end
