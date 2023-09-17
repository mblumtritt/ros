# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Symbol:convert - convert to a Symbol' do
  has_result_type(Symbol)

  samples = ['test', :test, -'sample', :sample, Object.new, 42].freeze

  code '#to_s#to_sym' do
    sample = samples.sample
    sample.to_s.to_sym
  end

  code '#respond_to?+#to_x' do
    sample = samples.sample
    sample.respond_to?(:to_sym) ? sample.to_sym : sample.to_s.to_sym
  end

  code 'defined?+#to_x' do
    sample = samples.sample
    defined?(sample.to_sym) ? sample.to_sym : sample.to_s.to_sym
  end
end

RubyOnSpeed.report! __FILE__
