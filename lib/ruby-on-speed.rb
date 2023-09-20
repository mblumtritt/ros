# frozen_string_literal: true

module RubyOnSpeed
  Error = Class.new(StandardError)
  Skipped = Class.new(StandardError)

  require_relative('ruby-on-speed/version')
  require_relative('ruby-on-speed/register')
  require_relative('ruby-on-speed/benchmark')
  require_relative('ruby-on-speed/fixtures')

  class << self
    def test(label, &block)
      raise('no block given') unless block
      load_fixture_file!
      Register.add(Benchmark.new(label, block))
    end

    def ignore
    end
    alias xtest ignore

    def fixtures(**pairs)
      pairs.each_pair { |name, value| Fixtures[name] = value }
    end

    def to_a
      Register.each.to_a
    end

    def test!
      Register.each.sum { |bm| test_benchmark(bm) ? 0 : 1 } == Register.size
    end

    def report!(file_name = nil, compact: false)
      return if file_name && file_name != Process.argv0
      require_relative('ruby-on-speed/default_reporter')
      run(DefaultReporter.new)
    end

    def compact_report!
      require_relative('ruby-on-speed/compact_reporter')
      run(CompactReporter.new)
    end

    def json_report!
      require_relative('ruby-on-speed/json_reporter')
      reporter = JSONReporter.new
      run(reporter)
      reporter.finalize
      true
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

    def load_fixture_file!
      fname =
        File.join(
          File.dirname(caller_locations(2, 1).first.absolute_path),
          'fixtures.rb'
        )
      require(fname) if File.file?(fname)
    end

    def test_benchmark(benchmark)
      benchmark.test!
      puts("✓ #{benchmark}")
      true
    rescue Skipped => e
      puts("• #{benchmark} (#{e})")
      true
    rescue Error => e
      $stderr.puts("❗️#{benchmark}: #{e}")
      false
    end

    def run(reporter)
      return false if Register.empty?
      reporter.start(Register.size)
      Register.each { |benchmark| benchmark.go!(reporter) }
      true
    rescue Interrupt
      puts("\b\b ") if $stdout.tty?
      $stderr.puts(' ABORTED')
      130
    end
  end
end
