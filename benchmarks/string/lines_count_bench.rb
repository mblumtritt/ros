# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark('String:lines_count - count number of lines') do
  sample = fixture(:lorem_ipsum)

  code '#lines#size' do
    sample.lines.size
  end

  code '#each_line#count' do
    sample.each_line.count
  end

  code '#count' do
    sample.count($/)
  end
end
