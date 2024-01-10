# frozen_string_literal: true

require_relative 'base'

module RubyOnSpeed
  class WinnerReporter < Reporter
    def start
      print("#{info.benchmark.name}: ")
    end

    def results(best, _other)
      puts(best.keys.join(', '))
    end

    def teardown
      puts
      super
    end
  end
end
