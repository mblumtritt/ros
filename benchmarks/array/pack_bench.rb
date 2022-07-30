# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array:pack - pack a binary sequence' do
  sample_array = [0, 1, 21, 42, 0xffff].freeze

  code 'count', -> { sample_array.pack('l<5') }
  code 'combined', -> { sample_array.pack('l<2l<l<2') }
  code 'dedicated', -> { sample_array.pack('l<l<l<l<l<') }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
