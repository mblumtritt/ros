# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'String: remove single char' do
  sample_string = <<-EOS
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  EOS

  regexp = / /
  code '#gsub',   ->{ sample_string.gsub(regexp, '') }
  code '#tr',     ->{ sample_string.tr(' ', '') }
  code '#delete', ->{ sample_string.delete(' ') }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
