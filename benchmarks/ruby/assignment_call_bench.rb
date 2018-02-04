require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Ruby: assignment' do
  Test = Class.new do
    def prop(x, y, value)
      x + y + value
    end

    def []=(x, y, value)
      x + y + value
    end
  end.new

  code 'call', ->{ Test.prop(20, 20, 2) }
  code '[]=',  ->{ Test[20, 20] = 2 }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
