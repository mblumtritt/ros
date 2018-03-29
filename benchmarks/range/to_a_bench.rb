require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Range: to_a' do
  sample_range = (1..10_000).freeze

  code '#to_a',    ->{ sample_range.to_a }
  code '[*range]', ->{ [*sample_range] }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
