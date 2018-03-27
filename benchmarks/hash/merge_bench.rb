require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Hash: merge vs double splat' do
  sample = ('a'..'z').to_a.map!{ |c| [c.to_sym, c] }.to_h.freeze # does not work with Strings as keys?!

  code '#merge', ->{ {a: 1, b: 2, 1 => :a, 2 => :b}.merge(sample) }
  code '#**',    ->{ {a: 1, b: 2, 1 => :a, 2 => :b, **sample} }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
