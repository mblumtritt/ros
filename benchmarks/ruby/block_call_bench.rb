require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby: block call' do
  def block_call(arg, &block)
    block.call(arg)
  end

  def proc_call(arg)
    proc.call(arg)
  end

  def block_idx(arg, &block)
    block[arg]
  end

  def proc_idx(arg)
    proc[arg]
  end

  def use_yield(arg)
    yield(arg)
  end

  code 'yield',     ->{ use_yield(1){ |i| i + i } }
  code '&block',    ->{ block_call(1){ |i| i + i } }
  code 'proc',      ->{ proc_call(1){ |i| i + i } }
  code '&block#[]', ->{ block_idx(1){ |i| i + i } }
  code 'proc#[]',   ->{ proc_idx(1){ |i| i + i } }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
