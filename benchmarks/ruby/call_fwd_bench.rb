# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby: call forwarding' do
  class CallOrigin
    attr_accessor :value

    def initialize
      @value = 21
    end

    def caller
      CallCaller.new(-> { @value }, ->(arg) { @value = arg })
    end
  end

  class CallShadow
    attr_reader :origin

    def initialize(origin, entity)
      @origin = origin
      @entity = entity
      @entity_setter = "#{entity}="
    end

    def value
      @origin.__send__(@entity)
    end

    def value=(arg)
      @origin.__send__(@entity_setter, arg)
    end
  end

  class CallCaller
    def initialize(getter, setter)
      @getter, @setter = getter, setter
    end

    def value
      @getter.call
    end

    def value=(arg)
      @setter.call(arg)
    end
  end

  origin = CallOrigin.new
  shadow = CallShadow.new(origin, :value)
  caller = origin.caller
  caller2 = CallCaller.new(-> { origin.value }, ->(arg) { origin.value = arg })

  code 'origin#value',   -> { origin.value }
  code 'origin#value=',  -> { origin.value = 42 }
  code 'shadow#value',   -> { shadow.value }
  code 'shadow#value=',  -> { shadow.value = 42 }
  code 'caller#value',   -> { caller.value }
  code 'caller#value=',  -> { caller.value = 42 }
  code 'caller2#value',  -> { caller2.value }
  code 'caller2#value=', -> { caller2.value = 42 }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
