require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Remove a single char from String' do
  sample_string = <<-EOS.freeze
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  EOS

  REGEX = / /
  code '#gsub',   ->{ sample_string.gsub(REGEX, ''.freeze) }
  code '#tr',     ->{ sample_string.tr(' '.freeze, ''.freeze) }
  code '#delete', ->{ sample_string.delete(' '.freeze) }
end

RubyOnSpeed.report! if $0 == __FILE__
