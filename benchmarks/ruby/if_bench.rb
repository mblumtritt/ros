# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Ruby:if - if vs. ternary if vs. and' do
  sample1 = 42
  sample2 = 42

  code 'if' do
    42 if sample1 == sample2
  end

  code 'ternary if' do
    sample1 == sample2 ? 42 : 21
  end

  code 'and' do
    sample1 == sample2 and 42
  end
end
