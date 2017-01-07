require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Array: pack' do
  sample_array = [0, 1, 21, 42, 0xffff].freeze

  code 'pack_count', ->{ sample_array.pack('l<5') }
  code 'pack_combined', ->{ sample_array.pack('l<2l<l<2') }
  code 'pack_dedicated', ->{ sample_array.pack('l<l<l<l<l<') }
end

RubyOnSpeed.report! if $0 == __FILE__
