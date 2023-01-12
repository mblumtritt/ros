# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'String:remove_chars - remove some chars' do
  sample = fixture(:lorem_ipsum)

  code '#gsub' do
    sample.gsub(%r{ |e}, '')
  end

  code '#tr' do
    sample.tr(' e', '')
  end

  code '#delete' do
    sample.delete(' e')
  end
end

RubyOnSpeed.report! __FILE__
