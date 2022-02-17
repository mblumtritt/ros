require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'String: concatinate' do
  sample_string = <<-EOS.freeze
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  EOS

  code '#+', -> { 'just a test' + sample_string }
  code '"...#{str}"', -> { "just a test#{sample_string}" }
  code '#<<', -> { 'just a test' << sample_string }
  code '#concat', -> { 'just a test'.concat(sample_string) }
  code '#%', -> { 'just a test%s' % sample_string }
  code '#format', -> { format('just a test%s', sample_string) }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
