require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Array: get count of entries ' do
  sample_array = Array.new(1000).freeze

  code '#size',  ->{ sample_array.size }
  code '#count', ->{ sample_array.count }
  code '#length', ->{ sample_array.length }
end

RubyOnSpeed.report! if $0 == __FILE__
