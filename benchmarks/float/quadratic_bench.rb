# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Float: compare X**2 vs. x * x' do
  code 'x**2', -> { 113.11**2 }
  code 'x * x', -> { 113.11 * 113.11 }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
