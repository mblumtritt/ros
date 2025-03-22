# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Hash:as_string - create a key/value String' do
  sample = ('aa'..'zz').to_h { [_1.to_sym, _1] }.freeze

  code '#{interpolated}' do
    sample.map { |k, v| "#{k}: #{v}" }
  end

  code '#join' do
    sample.map { _1.join(': ') }
  end
end
