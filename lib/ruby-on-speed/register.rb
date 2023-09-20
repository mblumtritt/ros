# frozen_string_literal: true

module RubyOnSpeed
  module Register
    @reg = {}

    def self.empty?
      @reg.empty?
    end

    def self.size
      @reg.size
    end

    def self.benchmark_size
      sum = 0
      @reg.each_value { |bm| sum += bm.entries.size }
      sum
    end

    def self.names
      @reg.keys.sort!
    end

    def self.add(benchmark)
      @reg.key?(benchmark.label) and
        raise("benchmark already registered - #{benchmark.label}")
      @reg[benchmark.label] = benchmark
    end

    def self.delete(name)
      @reg.delete(name)
    end

    def self.each
      return enum_for(__method__) unless block_given?
      names.each { |name| yield(@reg[name]) }
    end

    def self.keep_if
      return enum_for(__method__) unless block_given?
      names.each { |name| delete(name) unless yield(name) }
    end
  end
end
