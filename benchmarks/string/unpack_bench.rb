# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'String:unpack - Integers from binary String' do
  sample = [0, 1, 21, 42, 0xffff].pack('l<5').freeze

  code 'count' do
    sample.unpack('l<5')
  end

  code 'combined' do
    sample.unpack('l<2l<l<2')
  end

  code 'dedicated' do
    sample.unpack('l<l<l<l<l<')
  end
end
