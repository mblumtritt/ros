# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array:concat - concatenate two Arrays' do
  sample_array = Array.new(1000, &:itself).freeze

  code '#+' do
    Array.new(sample_array) + sample_array
  end

  code '#concat' do
    Array.new(sample_array).concat(sample_array)
  end

  code '#[]#flatten!' do
    [sample_array, sample_array].flatten!(1)
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
