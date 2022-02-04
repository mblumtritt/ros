# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Hash: merge vs double splat' do
  # does not work with Strings as keys?!
  sample = ('a'..'z').to_a.map! { |c| [c.to_sym, c] }.to_h.freeze

  code '#merge', -> { { :a => 1, :b => 2, 1 => :a, 2 => :b }.merge(sample) }
  code '#**', -> { { :a => 1, :b => 2, 1 => :a, 2 => :b, **sample } }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
