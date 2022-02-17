# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'String: start with' do
  sample_string = (1_000..5_000).map { |n| n.odd? ? "--#{n}" : n.to_s }.freeze

  code '#start_with?' do
    sample_string.map { |s| s.start_with?('--') }
  end

  code '#[0..n]#==' do
    sample_string.map { |s| s[0..1] == '--' }
  end

  code '#[0, n]#==' do
    sample_string.map { |s| s[0, 2] == '--' }
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
