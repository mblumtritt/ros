require_relative '../lib/ruby_on_speed'

RubyOnSpeed.check do
  TEST_PROC = proc do |a, b|
    a + b
  end

  code 'Proc#call', ->{ TEST_PROC.call(1,2) }
  code 'Proc#[]',   ->{ TEST_PROC[1,2] }
end
