# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array: fill' do
  code '::new', -> { Array.new(100, &:itself) }
  code '#fill', -> { [].fill(0, 100, &:itself) }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
