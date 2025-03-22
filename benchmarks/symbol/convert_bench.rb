# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Symbol:convert - convert to a Symbol' do
  test_by_type!

  array = ['test', :test, -'array', :array, Object.new, 42].freeze

  code '#to_s#to_sym' do
    array.map { _1.to_s.to_sym }
  end

  code 'defined?+#to_x' do
    array.map { defined?(_1.to_sym) ? _1.to_sym : _1.to_s.to_sym }
  end

  code '#respond_to?+#to_x' do
    array.map { _1.respond_to?(:to_sym) ? _1.to_sym : _1.to_s.to_sym }
  end

  code 'interpolation' do
    array.map { :"#{_1}" }
  end
end
