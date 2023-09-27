# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'String:remove_char - remove a single char' do
  sample = fixture(:lorem_ipsum)

  code '#gsub' do
    sample.gsub(%r{ }, '')
  end

  code '#tr' do
    sample.tr(' ', '')
  end

  code '#delete' do
    sample.delete(' ')
  end
end

RubyOnSpeed.report! __FILE__
