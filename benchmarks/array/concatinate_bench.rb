# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array: concatinate' do
  sample_array = Array.new(1000, &:itself).freeze

  code '#+',           ->{ Array.new(sample_array) + sample_array }
  code '#concat',      ->{ Array.new(sample_array).concat(sample_array) }
  code '#[]#flatten!', ->{ [sample_array, sample_array].flatten!(1) }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
