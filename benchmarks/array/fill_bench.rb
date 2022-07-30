# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array:fill - create an Array with Integers' do
  code '::new', -> { Array.new(100, &:itself) }
  code '#fill', -> { [].fill(0, 100, &:itself) }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
