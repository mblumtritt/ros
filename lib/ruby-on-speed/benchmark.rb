# frozen_string_literal: true

require 'benchmark/ips'
require_relative 'fixtures'

module RubyOnSpeed
  class Benchmark
    attr_reader :source_file_name
    attr_writer :skip_test_reason, :test_method

    def initialize(label, block)
      @label = label
      @block = block
      @source_file_name = block.source_location[0]
      @test_method = :call
    end

    def entries
      if @entries.nil?
        @entries = {}
        DSL.new(self, @block)
        @block = nil
      end
      @entries
    end

    def add(name, block)
      name = name.to_s
      raise('no name given') if name.empty?
      raise("name already used - #{name}") if entries.key?(name)
      @entries[name] = Job::Entry.new(name, block)
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

    def relative_source_file_name
      @@root_dir ||= File.expand_path('../..', __dir__)
      ".#{source_file_name.delete_prefix(@@root_dir)}"
    end

    def test_result
      values = entries.values
      return :skipped, @skip_test_reason if @skip_test_reason
      test = @test_method.to_proc
      first = values.shift
      result = test[first.action]
      values.each do |entry|
        if test[entry.action] != result
          return :error, "#{entry.label} has different result as #{first.label}"
        end
      end
      :ok
    end

    def run(reporter)
      job = Job.new
      job.list.concat(entries.values.shuffle)
      job.reporter = reporter
      reporter.benchmark_start(self)
      job.run
    end

    class Job < ::Benchmark::IPS::Job
      def reporter=(reporter)
        @out = reporter
      end

      class Entry
        attr_reader :name, :action

        alias label name

        def call_times(times)
          times.times(&@action)
        end

        def initialize(name, action)
          @name = name
          @action = action
        end
      end
    end
    private_constant :Job

    class DSL
      def initialize(benchmark, block)
        @benchmark = benchmark
        instance_exec(&block)
      end

      def code(name, &block)
        raise('no block given') if block.nil?
        @benchmark.add(name, block)
      end

      def ignore(*_)
        # nop
      end
      alias xcode ignore

      def fixture(name)
        Fixtures[name]
      end

      def test_with
        @benchmark.test_method = ->(v) { yield(v.call) }
      end

      def test_by_type!
        @benchmark.test_method = :class
      end

      def test_boolean_results!
        @benchmark.test_method = ->(v) { v == true || v == false }
      end

      def test_truthy_results!
        @benchmark.test_method = ->(v) { v ? true : false }
      end

      def has_random_results!
        @benchmark.skip_test_reason = 'random results'
      end
    end

    private_constant :DSL
  end
end
