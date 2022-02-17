# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Struct vs. Hash: new' do
  has_different_object_results!

  TestStruct = Struct.new(:a, :b, :c, :d)

  code 'Struct.new', -> { TestStruct.new(1, 2, 3, 4) }
  code 'Hash.new', -> { { a: 1, b: 2, c: 3, d: 4 } }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
