# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Range:rand - get a random element of a Range' do
  sample = (100..2000).freeze

  code 'inline' do
    rand(100..2000)
  end

  code 'explicate' do
    rand(sample)
  end
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
