# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array:fill - create an Array with Integers' do
  code '::new' do
    Array.new(100, &:itself)
  end

  code '#fill' do
    [].fill(0, 100, &:itself)
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
