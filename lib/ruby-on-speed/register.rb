# frozen_string_literal: true

module RubyOnSpeed
  module Register
    @reg = {}

    class << self
      def names
        @reg.keys.sort!
      end

      def add(benchmark)
        if @reg.key?(benchmark.label)
          raise("benchmark already registered - #{benchmark.label}")
        end
        @reg[benchmark.label] = benchmark
      end

      def delete(name)
        @reg.delete(name)
      end

      def each
        return enum_for(__method__) unless block_given?

        names.each { |name| yield(@reg[name]) }
      end

      def keep_if
        return enum_for(__method__) unless block_given?

        names.each { |name| delete(name) unless yield(name) }
      end

      def size
        @reg.values.sum { |bm| bm.entries.size }
      end
    end
  end
end
