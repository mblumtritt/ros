# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Hash:merge - merge two Hashes' do
  # does not work with Strings as keys?!
  sample = Hash[('a'..'z').to_a.map! { |c| [c.to_sym, c] }].freeze

  code '#merge' do
    { :a => 1, :b => 2, 1 => :a, 2 => :b }.merge(sample)
  end

  code '#**' do
    { :a => 1, :b => 2, 1 => :a, 2 => :b, **sample }
  end
end

RubyOnSpeed.report! __FILE__
