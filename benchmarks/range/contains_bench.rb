# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'
require 'date'

RubyOnSpeed.test 'Range:contains - test if an item is in a Range' do
  sample = (Date.new(2000)..Date.new(2001)).freeze
  item = (sample.last - 42).freeze

  code '#cover?' do
    sample.cover?(item)
  end

  code 'compare1' do
    sample.first <= item && item <= sample.last
  end

  code 'compare2' do
    sample.begin <= item && item <= sample.end
  end

  code '#member?' do
    sample.member?(item)
  end

  code '#include?' do
    sample.include?(item)
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
