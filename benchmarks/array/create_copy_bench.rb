require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Array: create copy' do
  sample_array = Array.new(1000){ Object.new }.freeze

  code '::new',       ->{ Array.new(sample_array) }
  code '#dup',        ->{ sample_array.dup }
  code '[*array]',         ->{ [*sample_array] }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
