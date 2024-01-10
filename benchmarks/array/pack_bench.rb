# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:pack - pack a binary sequence' do
  sample = [0, 1, 21, 42, 0xffff].freeze

  code 'count' do
    sample.pack('l<5')
  end

  code 'combined' do
    sample.pack('l<2l<l<2')
  end

  code 'dedicated' do
    sample.pack('l<l<l<l<l<')
  end
end
