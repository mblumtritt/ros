# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby:if - if vs. ternary if vs. and' do
  code 'if_end' do
    42 if 1 == 1
  end

  code 'if modifier' do
    42 if 1 == 1
  end

  code 'ternary if' do
    1 == 1 ? 42 : 21
  end

  code 'and' do
    1 == 1 and 42
  end
end

RubyOnSpeed.report! __FILE__
