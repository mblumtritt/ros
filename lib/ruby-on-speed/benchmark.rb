# frozen_string_literal: true

require 'benchmark/ips'

module RubyOnSpeed
  ROOT_DIR = File.expand_path('../..', __dir__)

  class Benchmark
    attr_reader :source_file_name

    def initialize(label, block)
      @label = label
      @block = block
      @source_file_name = relative_source(block)
      @test_type = :call
    end

    def entries
      if @entries.nil?
        @entries = {}
        DSL.new(self, @block)
        @block = nil
      end
      @entries
    end

    def add(entry)
      label = entry.label
      raise('no name given') if label.empty?
      raise("name already used - #{label}") if entries.key?(label)
      @entries[label] = entry
    end

    def skip_test_reason=(value)
      @skip_test_reason = value
    end

    def test_with(&block)
      @test_type = block
    end

    def label
      @label ||= entries.keys.join(' vs. ')
    end
    alias to_s label

    def name
      label.split(' - ', 2).first
    end

    def description
      label.split(' - ', 2).last
    end

    def test!
      values = entries.values
      raise(Skipped, @skip_test_reason) if @skip_test_reason
      test_all(values, &@test_type)
    end

    def go!(reporter)
      reporter.bm = self
      job = Job.new
      job.suite = nil
      job.reporter = reporter
      job.list.concat(entries.values.shuffle)
      reporter.start_warming
      job.run_warmup
      reporter.start_running
      job.run_benchmark
      reporter.run_comparison
    end

    private

    def relative_source(block)
      './' + block.source_location.first.delete_prefix(ROOT_DIR)[1..]
    end

    def test_all(entries)
      first = entries.shift
      result = yield(first.action)
      entries.each do |entry|
        unless yield(entry.action) == result
          raise(Error, "#{entry.label} has different result as #{first.label}")
        end
      end
    end

    class Job < ::Benchmark::IPS::Job
      def reporter=(reporter)
        @stdout = reporter
      end
    end

    class DSL
      def initialize(bm, block)
        @bm = bm
        instance_exec(&block)
      end

      def code(name, func = nil, &block)
        func ||= block
        raise('no proc given') unless func.respond_to?(:call)
        @bm.add(::Benchmark::IPS::Job::Entry.new(name, func))
      end
      alias report code

      def ignore(*_); end
      alias xcode ignore
      alias xreport ignore

      def has_random_results!
        @bm.skip_test_reason = 'has random results'
      end

      def has_truthy_results!
        @bm.test_with { |f| !!f.call }
      end

      def has_different_object_results!
        @bm.test_with { |f| f.call.is_a?(Object) }
      end
    end

    private_constant(:Job, :DSL)
  end
end
