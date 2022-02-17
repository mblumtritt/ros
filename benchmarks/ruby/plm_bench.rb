# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby: proc/lambda/method call' do
  sample_proc = proc { |arg| 21 + arg }
  sample_lambda = ->(arg) { 21 + arg }
  sample_method =
    Class
      .new do
        def add(arg)
          21 + arg
        end
      end
      .new
      .method(:add)

  code 'proc', -> { sample_proc.call(21) }
  code 'lambda', -> { sample_lambda.call(21) }
  code 'method', -> { sample_method.call(21) }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
