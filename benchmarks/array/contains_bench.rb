require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Array: contains element' do
  uses_boolean_results!
  sample_array = Array.new(1000){ Object.new }.freeze
  sample = sample_array[-42]

  code '#index',      ->{ sample_array.index(sample) }
  code '#find_index', ->{ sample_array.find_index(sample) }
  code '#include?',   ->{ sample_array.include?(sample) }
end

RubyOnSpeed.report! if $0 == __FILE__