# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:pack - pack a binary sequence' do
  array = [0, 1, 21, 42, 0xffff].freeze

  code 'count' do
    array.pack('l<5')
  end

  code 'combined' do
    array.pack('l<2l<l<2')
  end

  code 'dedicated' do
    array.pack('l<l<l<l<l<')
  end
end
