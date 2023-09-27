# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Hash:invalid_value - find non-existing value of Hash' do
  sample = fixture(:chars_hash)

  code '#[] || def' do
    sample['not'] || 'default'
  end

  code '#fetch(key, default)' do
    sample.fetch('not', 'default')
  end

  code '#fetch(key, &block)' do
    sample.fetch('not') { 'default' }
  end
end

RubyOnSpeed.report! __FILE__
