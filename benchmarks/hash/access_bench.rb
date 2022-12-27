# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Hash:access - get values of Hash in Hash' do
  sample = { a: { b: { c: { d: 1 } } } }

  code '#[]' do
    sample[:a][:b][:c][:d]
  end

  code '#dig' do
    sample.dig(:a, :b, :c, :d)
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
