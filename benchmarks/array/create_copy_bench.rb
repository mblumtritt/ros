require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Array: create copy' do
  sample_array = Array.new(1000){ Object.new }
  
  code '::new',       ->{ Array.new(sample_array) }
  code '#dup',        ->{ sample_array.dup }
  code '[*array]',         ->{ [*sample_array] }
end

RubyOnSpeed.report! if $0 == __FILE__
