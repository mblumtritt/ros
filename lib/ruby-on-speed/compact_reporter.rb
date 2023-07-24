# frozen_string_literal: true

require_relative 'reporter'

module RubyOnSpeed
  class CompactReporter < Reporter
    def bm=(value)
      puts(super(value).label)
    end

    def compare(best, others)
      puts(line)
      show_winners(best)
      show_others(best[0], others)
      puts(line, nil)
    end

    protected

    def show_others(best, others)
      others.each do |report|
        slowdown, error = report.stats.slowdown(best.stats)
        printf(
          '%20s: %10.1f i/s - %.2fx ',
          report.label,
          report.stats.central_tendency,
          slowdown
        )
        printf('(± %.2f) ', error) if error
        puts('slower')
      end
    end

    def show_winners(best)
      best.each do |report|
        puts(
          format(
            '%20s: %10.1f i/s',
            report.label,
            report.stats.central_tendency
          )
        )
      end
    end

    def line(char = '=')
      char * 79
    end
  end
end
