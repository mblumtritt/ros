require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'String: unpack' do
  sample = [0, 1, 21, 42, 0xffff].pack('l<5').freeze

  code 'unpack_count',     ->{ sample.unpack('l<5') }
  code 'unpack_combined',  ->{ sample.unpack('l<2l<l<2') }
  code 'unpack_dedicated', ->{ sample.unpack('l<l<l<l<l<') }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
