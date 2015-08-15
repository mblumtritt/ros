require 'benchmark/ips'

module RubyOnSpeed
  class Benchmark
    attr_reader :entries

    def initialize
      @entries = {}
      @label = @report = @skip_test_reason = @uses_boolean_results = nil
    end

    def code(name, proc = nil, &block)
      (proc ||= block).respond_to?(:call) or raise('no proc or block given')
      entry = ::Benchmark::IPS::Job::Entry.new(name, proc)
      entry.label.size.zero? and raise('no name given')
      @entries.key?(entry.label) and raise("name already used - #{entry.label}")
      @entries[entry.label] = entry
    end
    alias report code

    def uses_randomization!
      @skip_test_reason = 'uses randomization'
    end

    def uses_boolean_results!
      @uses_boolean_results = true
    end

    def nop(*_)
    end
    alias ignore nop
    alias xcode nop

    def label
      @label ||= @entries.keys.join(' vs. ')
    end
    alias to_s label

    def test!
      @skip_test_reason and raise(Skipped, @skip_test_reason)
      if @uses_boolean_results
        test_boolean_results(@entries.values)
      else
        test_results(@entries.values)
      end
    end

    def go!(reporter)
      reporter.bm = self
      ips_job = ::Benchmark::IPS::Job.new(reporter.options)
      @entries.values.shuffle.each{ |entry| ips_job.list.push(entry) }
      reporter.warming_start
      ips_job.run_warmup
      reporter.run_start
      ips_job.run
      reporter.report
    end

    private

    def test_results(entries)
      first = entries.shift
      result = first.action.call
      entries.each do |entry|
        entry.action.call == result or raise(Error, "#{entry.label} has different result as #{first.label}")
      end
    end

    def test_boolean_results(entries)
      first = entries.shift
      result = !!first.action.call
      entries.each do |entry|
        !!entry.action.call == result or raise(Error, "#{entry.label} has different result as #{first.label}")
      end
    end
  end
end
