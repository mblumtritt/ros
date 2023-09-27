# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:concat - concatenate two Arrays' do
  sample_array = fixture(:integers)

  code '#+' do
    [] + sample_array + sample_array
  end

  code '#concat' do
    [].concat(sample_array).concat(sample_array)
  end
end

RubyOnSpeed.report! __FILE__
