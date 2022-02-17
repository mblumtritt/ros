# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array: access last element' do
  sample_array = Array.new(100, &:itself).freeze

  code '#[-1]', -> { sample_array[-1] }
  code '#last', -> { sample_array.last }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
