# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby: method call' do
  class CallA
    def check(num)
      21 + num
    end
  end

  class CallB < CallA
  end

  class CallC < CallA
    def check(num)
      super
    end
  end

  module CallD
    def check(num)
      21 + num
    end
  end

  class CallE
    include CallD
  end

  class CallF
    attr_reader :check

    def initialize
      @check = ->(num) { 21 + num }
    end
  end

  call_a = CallA.new
  call_b = CallB.new
  call_c = CallC.new
  call_e = CallE.new
  call_f = CallF.new
  call_g = Class.new.extend(CallD)

  code 'call', -> { call_a.check(21) }
  code 'send', -> { call_a.send(:check, 21) }
  code 'public_send', -> { call_a.public_send(:check, 21) }
  code '__send__', -> { call_a.__send__(:check, 21) }
  code 'method().call', -> { call_a.method(:check).call(21) }
  code 'inherited_call', -> { call_b.check(21) }
  code 'super_call', -> { call_c.check(21) }
  code 'included_call', -> { call_e.check(21) }
  code 'func', -> { call_f.check[21] }
  code 'extended_call', -> { call_g.check(21) }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
