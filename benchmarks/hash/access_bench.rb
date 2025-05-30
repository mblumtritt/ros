# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Hash:access - get values of Hash in Hash' do
  sample = { a: { b: { c: { d: 42 } } } }.freeze

  code '#[]' do
    sample[:a][:b][:c][:d]
  end

  code '#dig' do
    sample.dig(:a, :b, :c, :d)
  end
end
