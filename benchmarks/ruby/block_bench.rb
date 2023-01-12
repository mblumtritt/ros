# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby:block - call a block' do
  def use_yield(arg)
    yield(arg)
  end

  def block_call(arg, &block)
    block.call(arg)
  end

  def block_idx(arg, &block)
    block[arg]
  end

  block = proc { |i| i + i }

  code 'yield' do
    use_yield(1) { |i| i + i }
  end

  code '&block#call' do
    block_call(1) { |i| i + i }
  end

  code 'block#call' do
    block.call(1)
  end

  code 'block#[]' do
    block[1]
  end
end

RubyOnSpeed.report! __FILE__
