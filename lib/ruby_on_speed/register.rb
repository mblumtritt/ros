module RubyOnSpeed
  class Register
    def initialize
      @reg = {}
    end

    def names
      @reg.keys.sort!
    end

    def add(benchmark)
      @reg.key?(benchmark.label) and raise("benchmark already registered - #{benchmark.label}")
      @reg.store(benchmark.label, benchmark)
    end

    def delete(name)
      @reg.delete(name)
    end

    def each
      block_given? or return enum_for(__method__)
      names.map{ |name| yield @reg[name] }
    end

    def keep_if
      block_given? or return enum_for(__method__)
      names.each{ |name| yield(name) or delete(name) }
    end

    def size
      @reg.values.inject(1){ |sum, bm| sum + bm.entries.size }
    end
  end
end
