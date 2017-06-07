require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'String: formatting Float' do
  code 'String#%',         ->{ '%.2f' % Math::PI }
  code 'Kernel#format',    ->{ format('%.2f', Math::PI) }
  code 'Float#round#to_s', ->{ Math::PI.round(2).to_s }
  code 'Float#round (embed)', ->{ "#{Math::PI.round(2)}" }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
