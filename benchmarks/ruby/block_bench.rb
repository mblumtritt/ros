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

  BLOCK = proc { |i| i + i }

  code 'yield', -> { use_yield(1) { |i| i + i } }
  code '&block#call', -> { block_call(1) { |i| i + i } }
  code 'block#call', -> { BLOCK.call(1) }
  code 'block#[]', -> { BLOCK[1] }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
