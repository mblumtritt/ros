# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:sort - sort an Array' do
  sample_array = fixture(:dates)

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

RubyOnSpeed.report! __FILE__
