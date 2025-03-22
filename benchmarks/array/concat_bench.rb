# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:concat - concatenate two Arrays' do
  array = (0..999).to_a.freeze

  code '#+' do
    [] + array + array
  end

  code '#concat' do
    [].concat(array).concat(array)
  end
end
