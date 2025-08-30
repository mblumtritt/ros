# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Ruby:block_variable - kind of block variable' do
  sample = (0..1000).to_a

  code 'name' do
    sample.map { |name| name + name }
  end

  code 'it' do
    sample.map { it + it }
  end

  code '_1' do
    sample.map { _1 + _1 }
  end
end
