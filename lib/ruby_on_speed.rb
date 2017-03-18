module RubyOnSpeed
  NAME = name
  VERSION = '0.3.0'
  Error = Class.new(StandardError)
  Skipped = Class.new(StandardError)

  require_relative 'ruby_on_speed/register'
  require_relative 'ruby_on_speed/benchmark'

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
      Register.each{ |bm| test_benchmark(bm) }
    end

    def report!
      require_relative 'ruby_on_speed/reporter'
      run Reporter.create(:default)
    end

    def find_best!
      require_relative 'ruby_on_speed/reporter'
      run Reporter.create(:progress)
    end

    def compare!
      require_relative 'ruby_on_speed/reporter'
      run Reporter.create(:table)
    end

    def filter!(regexp)
      return unless regexp
      regexp = Regexp.new(regexp)
      Register.keep_if{ |name| regexp.match?(name) }
    rescue RegexpError => e
      self.action = :nop
      abort "ERROR: #{e}"
    end

    private

    def test_benchmark(bm)
      print "#{bm} ..."
      bm.test!
      puts 'ok'
    rescue Skipped => e
      puts "skipped - #{e}"
    rescue Error => e
      puts "error - #{e}"
    end

    def run(reporter)
      entries = Register.size
      return if entries.zero?
      reporter.start(entries)
      Register.each{ |bm| bm.go!(reporter) }
    rescue Interrupt
      $stderr.puts ' ABORTED'
    end
  end
end
