# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Boolean:assign - assign value' do
  test_boolean_results!
  array = [false, true, nil, 1, Object.new].freeze

  code '!!value' do
    array.map { !!_1 }
  end

  code '? true : false' do
    array.map { _1 ? true : false }
  end
end
