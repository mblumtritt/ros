# frozen_string_literal: true

return unless defined?(Data.define) # for some older Ruby versions

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Proc:to_proc - to_proc vs. call' do
  sample_type = Data.define(:value)
  samples = Array.new(23) { |i| sample_type.new(i) }

  code '#to_proc' do
    samples.sum(&:value)
  end

  code 'explicite' do
    samples.sum { |i| i.value }
  end
end

RubyOnSpeed.report! __FILE__
