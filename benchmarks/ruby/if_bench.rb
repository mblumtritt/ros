# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby:if - if vs. ternary if vs. and' do
  code 'if_end', -> { 42 if 1 == 1 }
  code 'if modifier', -> { 42 if 1 == 1 }
  code 'ternary if', -> { 1 == 1 ? 42 : 21 }
  code 'and', -> { 1 == 1 and 42 }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
