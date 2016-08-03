require_relative '../lib/ruby_on_speed'

SAMPLE_STRING = <<-EOS.freeze
  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
  consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
  cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
  proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
EOS

SAMPLE_STRING_ARRAY = (1_000..1_100).map{ |n| n.odd? ? "--#{n}" : n.to_s }

RubyOnSpeed.check do
  code 'String.start_with?' do
    SAMPLE_STRING_ARRAY.map{ |s| s.start_with?('--'.freeze) }
  end
  code 'String[0..n].==' do
    SAMPLE_STRING_ARRAY.map{ |s| s[0..1] == '--'.freeze }
  end
  code 'String[0, n].==' do
    SAMPLE_STRING_ARRAY.map{ |s| s[0, 2] == '--'.freeze }
  end
end

RubyOnSpeed.check do
  code '"#{string}"',  ->{ "#{SAMPLE_STRING}" }
  code 'String::new',  ->{ String.new(SAMPLE_STRING) }
  code 'String#dup',   ->{ SAMPLE_STRING.dup }
  code 'String#clone', ->{ SAMPLE_STRING.clone }
  code 'String#<<',    ->{ '' << SAMPLE_STRING }
end

RubyOnSpeed.check do
  code 'String#concat', ->{ 'just a test'.concat(SAMPLE_STRING) }
  code 'String#<<',     ->{ 'just a test' << SAMPLE_STRING }
  code 'String#+',      ->{ 'just a test' + SAMPLE_STRING }
  code 'String#%',      ->{ 'just a test%s' % SAMPLE_STRING }
  code '"...#{str}"',   ->{ "just a test#{SAMPLE_STRING}" }
end

RubyOnSpeed.check do
  TO_FIND = 'veniam'
  REPLACEMENT = 'Ruby'

  code 'String#[string]=' do
    str = SAMPLE_STRING.dup
    str[TO_FIND] = REPLACEMENT
    str
  end

  code 'String#sub(string)' do
    str = SAMPLE_STRING.dup
    str.sub(TO_FIND, REPLACEMENT)
  end

  code 'String#sub!(string)' do
    str = SAMPLE_STRING.dup
    str.sub!(TO_FIND, REPLACEMENT)
    str
  end

  code 'String#gsub(string)' do
    str = SAMPLE_STRING.dup
    str.gsub(TO_FIND, REPLACEMENT)
  end

  code 'String#gsub!(string)' do
    str = SAMPLE_STRING.dup
    str.gsub!(TO_FIND, REPLACEMENT)
    str
  end

  code 'String#use_index' do
    str = SAMPLE_STRING.dup
    idx = str.index(TO_FIND) and str[idx, TO_FIND.size] = REPLACEMENT
    str
  end
end
