# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Array:empty - use of an empty Array' do
  sample =
    Class
      .new do
        EMPTY = [].freeze

        def as_const
          EMPTY
        end

        def as_create
          []
        end
      end
      .new

  code 'const' do
    sample.as_const
  end

  code 'create' do
    sample.as_create
  end
end
