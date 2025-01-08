# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Hash:as_string - create a key/value String' do
  sample = fixture(:chars_hash_sym)

  code 'interpolated' do
    sample.map { |k, v| "#{k}: #{v}" }
  end

  code '#join' do
    sample.map { _1.join(': ') }
  end
end
