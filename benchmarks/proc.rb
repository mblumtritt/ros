require_relative '../lib/ruby_on_speed'

RubyOnSpeed.check do
  def use_block(arg, &block)
    block.call(arg)
  end

  def use_proc(arg)
    Proc.new.call(arg)
  end

  def use_yield(arg)
    yield arg
  end

  code '&block',   ->{ use_block(1){ |i| i } }
  code 'Proc.new', ->{ use_proc(1){ |i| i } }
  code 'yield',    ->{ use_yield(1){ |i| i } }
end
