require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Ruby:ensure - cost of ensure call' do
  sample_class =
    Class.new do
      def initialize
        @value = 1
      end

      def add_and_ensure(val)
        @value + val
      ensure
        @value += 1
      end

      def add(val)
        ret = @value + val
        @value += 1
        ret
      end
    end

  sample_a = sample_class.new
  sample_b = sample_class.new

  code 'ensure' do
    sample_a.add_and_ensure(42)
  end

  code 'ret' do
    sample_b.add(42)
  end
end
