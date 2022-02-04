# frozen_string_literal: true

require_relative 'reporter'

module RubyOnSpeed
  class JSONReporter < Reporter
    def bm=(value)
      (@tests ||= []).push({ title: value.label })
      super(value)
    end

    def current_data(with_details:)
      convert = with_details ? TO_DETAILED_DATA : TO_DATA
      @entries.sort_by { |e| e.stats.central_tendency }.reverse.map!(&convert)
    end

    def to_json
      @tests.size == 1 ? as_json(@tests[0]) : as_json(@tests)
    end

    def run_comparison
      @tests[-1][:data] = current_data(with_details: false)
    end

    def finalize
      puts(to_json)
    end

    private

    def as_json(obj)
      oj_json(obj) || default_json(obj)
    end

    def oj_json(obj)
      require('oj')
      ::Oj.dump(obj, mode: :compat)
    rescue LoadError
      nil
    end

    def default_json(obj)
      require('json')
      ::JSON.dump(obj)
    rescue LoadError
      nil
    end

    TO_DATA =
      proc do |entry|
        {
          name: entry.label,
          central_tendency: entry.stats.central_tendency,
          error: entry.stats.error,
          microseconds: entry.microseconds,
          iterations: entry.iterations,
          cycles: entry.measurement_cycle
        }
      end

    TO_DETAILED_DATA =
      proc do |entry|
        {
          name: entry.label,
          central_tendency: entry.stats.central_tendency,
          error: entry.stats.error,
          error_percentage: entry.error_percentage,
          microseconds: entry.microseconds,
          seconds: entry.seconds,
          iterations: entry.iterations,
          cycles: entry.measurement_cycle
        }
      end
  end
end
