# frozen_string_literal: true

require 'stringio'
require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark('String:line_split - split lines') do
  sample = "#{fixture(:lorem_ipsum)}\r\n#{fixture(:lorem_ipsum)}"

  code '#each_line#map' do
    sample.each_line(chomp: true).to_a
  end

  code '#split#map' do
    sample.split("\n").map!(&:chomp)
  end
end
