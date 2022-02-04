# frozen_string_literal: true

require_relative 'reporter'

module RubyOnSpeed
  class ProgressReporter < Reporter
    def bm=(value)
      print("#{super(value).label} ")
    end

    def start(count)
      puts("run #{count} benchmarks:", nil)
    end

    def nop(*_)
      print('.')
    end

    def compare(best, _others)
      puts(" fastest: #{best.map { |b| "'#{b.label}'" }.join(' and ')}")
    end
  end
end
