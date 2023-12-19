# frozen_string_literal: true

return unless defined?(Data)

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark(
  'Hash:from_indexed_array - create a Hash from positional Array'
) do
  data = fixture(:data)

  code 'Hash[#each_with_index#to_a#map!]' do
    Hash[data.each_with_index.to_a.map!(&:reverse!)]
  end

  code 'Array(size)#zip#to_h' do
    Array.new(data.size, &:itself).zip(data).to_h
  end

  code 'Hash[Array(size)#zip]' do
    Hash[Array.new(data.size, &:itself).zip(data)]
  end
end

RubyOnSpeed.report! __FILE__
