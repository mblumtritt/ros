require_relative '../lib/ruby_on_speed'

RubyOnSpeed.check do
  code 'sequential_assignment', ->{
    x = 42
    a = 1
    b = 2
    c = 3
    d = 4
    e = 5
    f = 6
    g = 7
    h = 8
    i = 9
    j = x
    nil
  }
  code 'parallel_assignment', ->{
    x = 42
    a, b, c, d, e, f, g, h, i, j = 1, 2, 3, 4, 5, 6, 7, 8, 9, x
    nil
  }
end

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

RubyOnSpeed.check do
  RETURN_TRUE = ->{ true }
  code 'if_end',      ->{ if RETURN_TRUE[]; 42; end }
  code 'if modifier', ->{ 42 if RETURN_TRUE[] }
  code 'ternary if',  ->{ RETURN_TRUE[] ? 42 : 21 }
  code 'and',         ->{ RETURN_TRUE[] and 42 }
end
