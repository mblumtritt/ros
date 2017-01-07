module RubyOnSpeed
  Register = Class.new do
    def initialize
      @reg = {}
    end

    def names
      @reg.keys.sort!
    end

    def add(benchmark)
      raise("benchmark already registered - #{benchmark.label}") if @reg.key?(benchmark.label)
      @reg[benchmark.label] = benchmark
    end

    def delete(name)
      @reg.delete(name)
    end

    def each
      block_given? ? names.map{ |name| yield(@reg[name]) } : enum_for(__method__)
    end

    def keep_if
      block_given? ? names.each{ |name| delete(name) unless yield(name)  } : enum_for(__method__)
    end

    def size
      @reg.values.inject(0){ |sum, bm| sum + bm.entries.size }
    end
  end.new
end
