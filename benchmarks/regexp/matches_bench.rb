# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Regexp: matches' do
  uses_boolean_results!
  sample_regexp = /cillum/
  sample_string = <<-EOS
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  EOS

  code '#match?',      ->{ sample_regexp.match?(sample_string) }
  code '#===',         ->{ sample_regexp === sample_string }
  code '#=~',          ->{ sample_regexp =~ sample_string }
  code 'string#=~',    ->{ sample_string =~ sample_regexp }
  code '#match',       ->{ sample_regexp.match(sample_string) }
  code 'string#match', ->{ sample_string.match(sample_regexp) }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
