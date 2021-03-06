# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array: pack' do
  sample_array = [0, 1, 21, 42, 0xffff].freeze

  code 'pack_count', ->{ sample_array.pack('l<5') }
  code 'pack_combined', ->{ sample_array.pack('l<2l<l<2') }
  code 'pack_dedicated', ->{ sample_array.pack('l<l<l<l<l<') }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
