require 'benchmark/ips'

module RubyOnSpeed
  class Benchmark
    attr_reader :entries

    def initialize(label)
      @entries, @label = {}, label
      @report = @skip_test_reason = @uses_boolean_results = nil
    end

    def code(name, func = nil, &block)
      raise('no proc or block given') unless (func ||= block).respond_to?(:call)
      entry = ::Benchmark::IPS::Job::Entry.new(name, func)
      raise('no name given') if entry.label.size.zero?
      raise("name already used - #{entry.label}") if @entries.key?(entry.label)
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
      raise(Skipped, @skip_test_reason) if @skip_test_reason
      @uses_boolean_results ? test_boolean_results(@entries.values) : test_results(@entries.values)
    end

    def go!(reporter)
      reporter.bm = self
      job = ::Benchmark::IPS::Job.new(reporter.options)
      @entries.values.shuffle.each{ |entry| job.list.push(entry) }
      reporter.warming_start
      job.run_warmup
      reporter.run_start
      job.run_benchmark
      reporter.report
    end

    private

    def test_results(entries)
      first = entries.shift
      result = first.action.call
      entries.each do |entry|
        raise(Error, "#{entry.label} has different result as #{first.label}") unless entry.action.call == result
      end
    end

    def test_boolean_results(entries)
      first = entries.shift
      result = !!first.action.call
      entries.each do |entry|
        raise(Error, "#{entry.label} has different result as #{first.label}") unless !!entry.action.call == result
      end
    end
  end
end
