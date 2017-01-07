require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Array: access first element' do
  sample_array = Array.new(100){ |n| n }

  code '#[0]',   ->{ sample_array[0] }
  code '#first', ->{ sample_array.first }
end

RubyOnSpeed.report! if $0 == __FILE__
