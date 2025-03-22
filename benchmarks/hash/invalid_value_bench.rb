# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Hash:invalid_value - find non-existing value of Hash' do
  sample = ('aa'..'zz').to_h { [_1, _1] }.freeze

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
