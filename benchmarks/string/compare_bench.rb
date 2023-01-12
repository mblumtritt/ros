# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'String:casecmp - comparing two Strings case-insensitive' do
  sample = fixture(:lorem_ipsum)

  code '#==' do
    sample.downcase == sample.downcase
  end

  code '#casecmp' do
    sample.casecmp(sample).zero?
  end

  code '#casecmp?' do
    sample.casecmp?(sample)
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
