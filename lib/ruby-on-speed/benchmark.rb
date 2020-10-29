# frozen_string_literal: true

require 'benchmark/ips'

module RubyOnSpeed
  class Benchmark
    def initialize(label, block)
      @label, @block = label, block
      @test_type = :call
      @entries = @report = @skip_test_reason = nil
    end

    def entries
      unless @entries
        @entries = {}
        instance_exec(&@block)
        @block = nil
      end
      @entries
    end

    def code(name, func = nil, &block)
      func ||= block
      raise('no proc given') unless func.respond_to?(:call)
      entry = ::Benchmark::IPS::Job::Entry.new(name, func)
      raise('no name given') if entry.label.empty?
      raise("name already used - #{entry.label}") if @entries.key?(entry.label)
      @entries[entry.label] = entry
    end
    alias report code

    def uses_randomization!
      @skip_test_reason = 'uses randomization'
    end

    def uses_different_objects!
      @skip_test_reason = 'uses different objects'
    end

    def uses_boolean_results!
      @test_type = ->(f){ !!f.call }
    end

    def nop(*_); end
    alias ignore nop
    alias xcode nop

    def label
      @label ||= entries.keys.join(' vs. ')
    end
    alias to_s label

    def test!
      raise(Skipped, @skip_test_reason) if @skip_test_reason
      test_all(entries.values, &@test_type)
    end

    def go!(reporter)
      reporter.bm = self
      job = ::Benchmark::IPS::Job.new(reporter.options)
      job.list.concat(entries.values.shuffle)
      reporter.warming_start
      job.run_warmup
      reporter.run_start
      job.run_benchmark
      reporter.report
    end

    private

    def test_all(entries)
      first = entries.shift
      result = yield(first.action)
      entries.each do |entry|
        unless yield(entry.action) == result
          raise(Error, "#{entry.label} has different result as #{first.label}")
        end
      end
    end
  end
end
