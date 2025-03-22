# frozen_string_literal: true

require 'date'
require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:sort - sort an Array' do
  array = (Date.new(2020)..Date.new(2023)).to_a.shuffle!.freeze
  sort_func = ->(a, b) { a.jd <=> b.jd }

  code '#sort_by(&)' do
    array.sort_by(&:jd)
  end

  code '#sort_by{}' do
    array.sort_by { _1.jd }
  end

  code '#sort{}' do
    array.sort { |a, b| a.jd <=> b.jd }
  end

  code '#sort(&)' do
    array.sort(&sort_func)
  end
end
