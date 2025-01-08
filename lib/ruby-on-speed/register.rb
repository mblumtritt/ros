# frozen_string_literal: true

module RubyOnSpeed
  module Register
    @reg = {}

    def self.empty? = @reg.empty?
    def self.size = @reg.size
    def self.names = @reg.keys.sort!
    def self.delete(name) = @reg.delete(name)

    def self.benchmark_size
      sum = 0
      @reg.each_value { |bm| sum += bm.entries.size }
      sum
    end

    def self.add(benchmark)
      @reg.key?(benchmark.label) and
        raise("benchmark already registered - #{benchmark.label}")
      @reg[benchmark.label] = benchmark
    end

    def self.each
      block_given? ? names.each { yield(@reg[_1]) } : enum_for(__method__)
    end

    def self.keep_if
      return names.each { delete(_1) unless yield(_1) } if block_given?
      enum_for(__method__)
    end
  end
end
