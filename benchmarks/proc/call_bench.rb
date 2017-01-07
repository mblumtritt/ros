require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Proc: call' do
  sample_proc = proc do |arg|
    21 + arg
  end

  code '#call', ->{ sample_proc.call(21) }
  code '#[]',   ->{ sample_proc[21] }
end

RubyOnSpeed.report! if $0 == __FILE__
