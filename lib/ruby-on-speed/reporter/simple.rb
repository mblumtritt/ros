# frozen_string_literal: true

require 'host-os'
require_relative 'default'

module RubyOnSpeed
  class SimpleReporter < DefaultReporter
    def start
      puts(info.benchmark.label)
    end

    def results(best, other)
      section('result')
      best.each_pair do |name, tendency|
        left_part("#{name}:")
        right_part("#{scaled(tendency)} i/s")
      end
      other.each_pair do |name, (tendency, slowdown)|
        left_part("#{name}:")
        right_part(tendency(tendency, slowdown))
      end
      puts('=' * 79, nil)
    end

    protected

    def section(str)
      puts("#{'-' * (75 - str.size)} #{str} --")
    end

    def left_part(str)
      if str.size > 38
        puts(" #{str}")
        print(' ' * 38)
      else
        print(str.rjust(38))
      end
    end

    def right_part(str)
      puts(str)
    end
  end
end
