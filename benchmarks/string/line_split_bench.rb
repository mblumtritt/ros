# frozen_string_literal: true

require 'stringio'
require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark('String:line_split - split lines') do
  sample = fixture(:lorem_ipsum)

  def string_io(*str)
    StringIO.open do |io|
      io.puts(str)
      io.rewind
      return io.each_line(chomp: true).to_a
    end
  end

  def map_each_line(*str)
    str.map { |sub| sub.to_s.each_line(chomp: true).to_a }.flatten
  end

  def each_each_line(*str)
    ret = []
    str.each { |sub| sub.to_s.each_line(chomp: true) { |l| ret << l } }
    ret
  end

  code 'StringIO.each_line' do
    string_io(*sample)
  end

  code 'map#each_line' do
    map_each_line(*sample)
  end

  code 'each#each_line' do
    each_each_line(*sample)
  end
end

RubyOnSpeed.report! __FILE__
