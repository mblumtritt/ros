# frozen_string_literal: true

require 'host-os'
require_relative 'base'

module RubyOnSpeed
  class DefaultReporter < Reporter
    def start
      str = info.benchmark.label
      puts("╭#{'─' * 77}╮", "│ ⚙︎ #{str}#{' ' * (74 - str.size)}│")
    end

    def warming_start
      section('warmup')
    end

    def test_warming_start
      left_part("#{info.test.name}:")
    end
    alias test_run_start test_warming_start

    def test_warming_end
      right_part(instruction_per_mill(info.test.warmup_timing))
    end

    def running_start
      section('benchmark')
    end

    def test_run_end
      stats = info.test.stats
      right_part(
        instruction_per_second(stats.central_tendency, stats.error_percentage)
      )
    end

    def results(best, other)
      puts("╞#{'═' * 68} result ═╡")
      best.each_pair do |name, tendency|
        left_part("#{name}:")
        right_part("#{scaled(tendency)} i/s")
      end
      other.each_pair do |name, (tendency, slowdown)|
        left_part("#{name}:")
        right_part(tendency(tendency, slowdown))
      end
      puts("╰#{'─' * 77}╯", nil)
    end

    protected

    def section(str)
      puts("├#{'─' * (74 - str.size)} #{str} ─┤")
    end

    def left_part(str)
      if str.size > 38
        puts("│ #{str}#{' ' * (75 - str.size)} │")
        print("│ #{' ' * 36}")
      else
        print("│ #{str.rjust(36)}")
      end
    end

    def right_part(str)
      puts("#{str}#{' ' * (40 - str.size)}│")
    end
  end
end
