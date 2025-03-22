# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'String:unpack - Integers from binary String' do
  string = [0, 1, 21, 42, 0xffff].pack('l<5').freeze

  code 'count' do
    string.unpack('l<5')
  end

  code 'combined' do
    string.unpack('l<2l<l<2')
  end

  code 'dedicated' do
    string.unpack('l<l<l<l<l<')
  end
end
