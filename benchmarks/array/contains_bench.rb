# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array: contains element' do
  uses_boolean_results!
  sample_array = Array.new(1000){ Object.new }.freeze
  sample = sample_array[-42].freeze

  code '#index',      ->{ sample_array.index(sample) }
  code '#find_index', ->{ sample_array.find_index(sample) }
  code '#include?',   ->{ sample_array.include?(sample) }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
