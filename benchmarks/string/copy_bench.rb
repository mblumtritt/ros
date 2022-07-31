require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'String:copy - create a String copy' do
  sample = <<-TEXT
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
    non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  TEXT

  code '::new', -> { String.new(sample) }
  code '#dup', -> { sample.dup }
  code 'string#<<', -> { '' << sample }
  code '"#{string}"', -> { "#{sample}" }
  code '#clone', -> { sample.clone }
end

RubyOnSpeed.report! if __FILE__ == Process.argv0
