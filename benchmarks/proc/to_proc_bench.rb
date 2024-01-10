# frozen_string_literal: true

return unless defined?(Data.define) # for some older Ruby versions

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Proc:to_proc - to_proc vs. call' do
  sample_type = Data.define(:value)
  sample = Array.new(23) { |i| sample_type.new(i) }

  code '#to_proc' do
    sample.sum(&:value)
  end

  code 'explicite' do
    sample.sum { |i| i.value }
  end
end
