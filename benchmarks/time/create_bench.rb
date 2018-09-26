# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Time: create' do
  code 'Time.new', ->{ Time.new(2018, 2, 12) }
  code 'Time.utc', ->{ Time.utc(2018, 2, 12) }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
