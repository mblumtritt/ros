# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Boolean:assign - assign value' do
  sample = Object.new

  code '!!value' do
    !!sample
  end

  code 'value=' do
    sample ? true : false
  end
end

RubyOnSpeed.report! __FILE__
