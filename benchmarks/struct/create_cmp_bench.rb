# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Struct:create_cmp - create a Struct vs. create a Hash' do
  has_different_object_results!

  Sample = Struct.new(:a, :b, :c, :d)

  code 'Struct.new', -> { Sample.new(1, 2, 3, 4) }
  code 'Hash.new', -> { { a: 1, b: 2, c: 3, d: 4 } }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
