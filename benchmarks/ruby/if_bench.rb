require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Ruby: if' do
  code 'if_end' do
    if 1 == 1
      42
    end
  end

  code 'if modifier' do
    42 if 1 == 1
  end

  code 'ternary if' do
    1 == 1 ? 42 : 21
  end

  code 'and' do
    1 == 1 and 42
  end
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
