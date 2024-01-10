# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:sort - sort an Array' do
  sample = fixture(:dates)

  code '#sort_by' do
    sample.sort_by(&:jd)
  end

  code '#sort' do
    sample.sort { |a, b| a.jd <=> b.jd }
  end

  code '#sort_by!' do
    Array.new(sample).sort_by!(&:jd)
  end

  code '#sort!' do
    Array.new(sample).sort! { |a, b| a.jd <=> b.jd }
  end
end
