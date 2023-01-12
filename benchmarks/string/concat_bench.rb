# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'
require_relative 'fixtures'

RubyOnSpeed.test 'String:concat - concat two Strings' do
  sample = fixture(:lorem_ipsum)

  code '#+' do
    'just a test' + sample
  end

  code '"...#{str}"' do
    "just a test#{sample}"
  end

  code '#<<' do
    +'just a test' << sample
  end

  code '#concat' do
    (+'just a test').concat(sample)
  end

  code '#%' do
    'just a test%s' % sample
  end

  code '#format' do
    format('just a test%s', sample)
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
