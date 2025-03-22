# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Hash:copy - create a copy of a Hash' do
  sample = ('aa'..'zz').to_h { [_1.to_sym, _1] }.freeze

  code '.[]' do
    Hash[sample]
  end

  code '#dup' do
    sample.dup
  end
end
