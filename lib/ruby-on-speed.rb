# frozen_string_literal: true

module RubyOnSpeed
  Error = Class.new(StandardError)

  require_relative('ruby-on-speed/version')
  require_relative('ruby-on-speed/register')
  require_relative('ruby-on-speed/fixtures')
  require_relative('ruby-on-speed/benchmark')

  class << self
    def report_formats
      REPORT_FORMATS.keys
    end

    def benchmark(label, &block)
      raise('no block given') unless block
      load_fixture_file!
      Register.add(Benchmark.new(label, block))
      @process_name ||= File.expand_path(Process.argv0)
      report if @process_name == caller_locations(1, 1).first.absolute_path
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

    def add_fixture(name, value = nil, &block)
      Fixtures.add(name, value, &block)
    end

    def fixtures(**pairs)
      pairs.each_pair { |name, value| Fixtures[name] = value }
    end

    def to_a = Register.each.to_a

    def test!(report: DEFAULT_TEST_REPORT, &block)
      block ||= report
      Register.each.sum do |bm|
        state, msg = bm.test_result
        block.call(state, bm, msg) if block
        state == :error ? 0 : 1
      end == Register.size
    end

    def report(format: 'default')
      require_relative("ruby-on-speed/reporter/#{format}")
      run(const_get("#{format.capitalize}Reporter").new)
    rescue LoadError
      raise(ArgumentError, "unknown report format - #{format}")
    end

    def filter!(*regexp)
      return if regexp.empty?
      Register.keep_if { |name| regexp.any? { _1.match?(name) } }
      self
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

    def count_valid
      Register.each.sum do |bm|
        state, msg = bm.test_result
        next 1 if state != :error
        $stderr.puts("❗️ Error found in '#{bm}' - #{msg}")
        0
      end
    end

    def run(reporter)
      return false if Register.empty?
      facade = ReportFacade.new(Register, reporter)
      facade.suite_start
      Register.each { _1.run(facade) } if count_valid == Register.size
      facade.suite_end
      true
    rescue Interrupt
      facade.interrupted!
      130
    end
  end
end
