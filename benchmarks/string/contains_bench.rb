# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark(
  'String:contains - test if a String contains another String'
) do
  has_truthy_results!

  sample = fixture(:lorem_ipsum)

  code '#index' do
    sample.index('pariatur')
  end

  code '#include?' do
    sample.include?('pariatur')
  end
end

RubyOnSpeed.report! __FILE__
