require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'String: start with' do
  sample_string = (1_000..5_000).map{ |n| n.odd? ? "--#{n}" : n.to_s }

  code '#start_with?' do
    sample_string.map{ |s| s.start_with?('--'.freeze) }
  end

  code '#[0..n]#==' do
    sample_string.map{ |s| s[0..1] == '--'.freeze }
  end

  code '#[0, n]#==' do
    sample_string.map{ |s| s[0, 2] == '--'.freeze }
  end
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
