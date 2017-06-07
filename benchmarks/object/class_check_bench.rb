require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Object: class check' do
  Foo = Class.new
  Bar = Class.new(Foo)
  bar = Bar.new

  code 'is_a?',    ->{ bar.is_a?(Foo) }
  code 'kind_of?', ->{ bar.kind_of?(Foo) }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME