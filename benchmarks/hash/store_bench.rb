# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Hash:store - add a key/value pair to a Hash' do
  code '#store' do
    {}.store(42, :Ruby)
  end

  code '#[]=' do
    {}[42] = :Ruby
  end
end

RubyOnSpeed.report! __FILE__
