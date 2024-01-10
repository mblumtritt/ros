# frozen_string_literal: true

require 'host-os'
require_relative 'base'

module RubyOnSpeed
  class CompactReporter < Reporter
    def results(best, other)
      puts("• #{info.benchmark.label}:")
      width = (best.keys + other.keys).max_by(&:size).size + 2
      best.each_pair do |name, tendency|
        puts("#{name.rjust(width)}: #{scaled(tendency)} i/s")
      end
      other.each_pair do |name, (tendency, slowdown)|
        puts("#{name.rjust(width)}: #{tendency(tendency, slowdown)}")
      end
      puts
    end
  end
end
