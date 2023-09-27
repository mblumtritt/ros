# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:pack - pack a binary sequence' do
  sample_array = [0, 1, 21, 42, 0xffff].freeze

  code 'count' do
    sample_array.pack('l<5')
  end

  code 'combined' do
    sample_array.pack('l<2l<l<2')
  end

  code 'dedicated' do
    sample_array.pack('l<l<l<l<l<')
  end
end

RubyOnSpeed.report! __FILE__
