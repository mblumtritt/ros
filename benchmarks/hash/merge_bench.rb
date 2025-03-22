# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Hash:merge - merge two Hashes' do
  sample = ('a'..'z').to_h { |c| [c, c] }.freeze

  code '#merge' do
    { 'a' => 1, 'b' => 2, 1 => 'a', 2 => 'b' }.merge(sample)
  end

  code '#**' do
    { 'a' => 1, 'b' => 2, 1 => 'a', 2 => 'b', **sample }
  end
end
