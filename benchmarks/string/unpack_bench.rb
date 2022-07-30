# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'String:unpack - Integers from binary String' do
  sample = [0, 1, 21, 42, 0xffff].pack('l<5').freeze

  code 'count', -> { sample.unpack('l<5') }
  code 'combined', -> { sample.unpack('l<2l<l<2') }
  code 'dedicated', -> { sample.unpack('l<l<l<l<l<') }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
