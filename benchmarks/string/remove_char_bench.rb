# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'String:remove_char - remove a single char' do
  sample = fixture(:lorem_ipsum)
  regexp = %r{ }

  code '#gsub' do
    sample.gsub(regexp, '')
  end

  code '#tr' do
    sample.tr(' ', '')
  end

  code '#delete' do
    sample.delete(' ')
  end
end

RubyOnSpeed.report! __FILE__
