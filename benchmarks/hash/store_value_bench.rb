require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Hash: store value' do
  code '#store', ->{ {}.store(42, :Ruby) }
  code '#[]=',   ->{ {}[42] = :Ruby }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
