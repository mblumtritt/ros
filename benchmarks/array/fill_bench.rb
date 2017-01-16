require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Array: fill' do
  code '::new', ->{ Array.new(100, &:itself) }
  code '#fill', ->{ [].fill(0, 100, &:itself) }
end

RubyOnSpeed.report! if $0 == __FILE__
