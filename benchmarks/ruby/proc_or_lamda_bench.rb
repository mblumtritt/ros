require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Ruby: proc/lambda call' do
  sample_proc = proc{ |arg| 21 + arg }
  sample_lambda = ->(arg){ 21 + arg }

  code 'proc',     ->{ sample_proc.call(21) }
  code 'lambda',   ->{ sample_lambda.call(21) }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
