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

RubyOnSpeed.check do
  class ConstA
    CONST = 21
    def self.check(x)
      CONST + x
    end
  end

  class ConstB
    CONST = 21
    def self.check(x)
      self::CONST + x
    end
  end

  class ConstC
    def self.check(x)
      21 + x
    end
  end

  code 'CONST',         ->{ ConstA.check(21) }
  code 'self::CONST',   ->{ ConstB.check(21) }
  code 'direct',        ->{ ConstC.check(21) }
end

RubyOnSpeed.check do
  class CallA
    def check(x)
      21 + x
    end
  end

  class CallB < CallA
  end

  class CallC < CallA
    def check(x)
      super
    end
  end

  module CallD
    def check(x)
      21 + x
    end
  end

  class CallE
    include CallD
  end

  CallAInstance = CallA.new
  CallBInstance = CallB.new
  CallCInstance = CallC.new
  CallEInstance = CallE.new
  CallFInstance = Class.new.extend(CallD)

  code 'call',            ->{ CallAInstance.check(21) }
  code 'send',            ->{ CallAInstance.send(:check, 21) }
  code 'inherited_call',  ->{ CallBInstance.check(21) }
  code 'super_call',      ->{ CallCInstance.check(21) }
  code 'included_call',   ->{ CallEInstance.check(21) }
  code 'extended_call',   ->{ CallFInstance.check(21) }
end

RubyOnSpeed.check do
  def pack_unpack(format, *values)
    values.pack(format).unpack(format)
  end

  code 'pack_unpack_fixed', ->{ pack_unpack('l<l<l<l<l<', 0, 1, 21, 42, 0xffff) }
  code 'pack_unpack_count', ->{ pack_unpack('l<5', 0, 1, 21, 42, 0xffff) }
end
