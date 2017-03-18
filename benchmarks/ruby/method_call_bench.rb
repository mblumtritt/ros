require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Ruby: method call' do
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

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
