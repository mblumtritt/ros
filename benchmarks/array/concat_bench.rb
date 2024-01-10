# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:concat - concatenate two Arrays' do
  sample = fixture(:integers)

  code '#+' do
    [] + sample + sample
  end

  code '#concat' do
    [].concat(sample).concat(sample)
  end
end
