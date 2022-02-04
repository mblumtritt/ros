# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Integer: compare X**2 vs. x * x' do
  code 'x**2', -> { 113**2 }
  code 'x * x', -> { 113 * 113 }
end

# RubyOnSpeed.test! if __FILE__ == $PROGRAM_NAME
RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
