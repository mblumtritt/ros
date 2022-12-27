# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Hash:access - get values of Hash in Hash' do
  sample = { a: { b: { c: { d: 1 } } } }

  code '#[]', -> { sample[:a][:b][:c][:d] }
  code '#dig', -> { sample.dig(:a, :b, :c, :d) }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
