# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Symbol:convert - convert to a Symbol' do
  test_by_type!

  sample = ['test', :test, -'sample', :sample, Object.new, 42].freeze

  code '#to_s#to_sym' do
    sample.map { _1.to_s.to_sym }
  end

  code 'interpolation' do
    sample.map { :"#{_1}" }
  end

  code '#respond_to?+#to_x' do
    sample.map { _1.respond_to?(:to_sym) ? _1.to_sym : _1.to_s.to_sym }
  end

  code 'defined?+#to_x' do
    sample.map { defined?(_1.to_sym) ? _1.to_sym : _1.to_s.to_sym }
  end
end
