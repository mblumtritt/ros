# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'
require 'date'

RubyOnSpeed.test 'Array:sort - sort an Array' do
  sample_array = (Date.new(2000)..Date.new(2015)).to_a.shuffle!.freeze

  code '#sort_by' do
    sample_array.sort_by(&:jd)
  end

  code '#sort' do
    sample_array.sort { |a, b| a.jd <=> b.jd }
  end

  code '#sort_by!' do
    Array.new(sample_array).sort_by!(&:jd)
  end

  code '#sort!' do
    Array.new(sample_array).sort! { |a, b| a.jd <=> b.jd }
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
