# frozen_string_literal: true

module RubyOnSpeed
  Error = Class.new(StandardError)
  Skipped = Class.new(StandardError)

  require_relative('ruby-on-speed/version')
  require_relative('ruby-on-speed/register')
  require_relative('ruby-on-speed/fixtures')
  require_relative('ruby-on-speed/benchmark')

  class << self
    def benchmark(label, &block)
      raise('no block given') unless block
      load_fixture_file!
      Register.add(Benchmark.new(label, block))
      label
    end
    alias test benchmark

    def ignore
      # nop
    end
    alias xbenchmark ignore
    alias xtest ignore

    def fixture(name)
      Fixtures[name]
    end

    def fixtures(**pairs)
      pairs.each_pair { |name, value| Fixtures[name] = value }
    end

    def to_a
      Register.each.to_a
    end

    def test!(&block)
      block ||= DEFAULT_TEST_REPORT
      Register.each.sum { |bm| test_benchmark(bm, &block) } == Register.size
    end

    def report_formats
      REPORT_FORMATS.keys
    end

    def report!(file_name = nil, format: nil)
      return if file_name && file_name != Process.argv0
      format ||= 'default'
      require_relative("ruby-on-speed/reporter/#{format}")
      run(const_get("#{format.capitalize}Reporter").new)
    rescue LoadError
      raise(ArgumentError, "unknown report format - #{format}")
    end

    def filter!(*regexp)
      return if regexp.empty?
      Register.keep_if { |name| regexp.any? { |re| re.match?(name) } }
    end

    private

    DEFAULT_TEST_REPORT =
      proc do |state, benchmark, msg|
        case state
        when :ok
          puts("✓ #{benchmark}")
        when :skipped
          puts("• #{benchmark} (#{msg})")
        when :error
          $stderr.puts("❗️ #{benchmark}: #{msg}")
        end
      end
    private_constant(:DEFAULT_TEST_REPORT)

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
      yield(:ok, benchmark)
      1
    rescue Skipped => e
      yield(:skipped, benchmark, e)
      1
    rescue Error => e
      yield(:error, benchmark, e)
      0
    end

    def run(reporter)
      return false if Register.empty?
      reporter.suite_start(Register.size)
      Register.each { |benchmark| benchmark.run(reporter) }
      reporter.suite_end
      true
    rescue Interrupt
      reporter.interrupted!
      130
    end
  end
end
