require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'String: replace' do
  sample_string = <<-EOS.freeze
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  EOS

  code '#[a]=b' do
    str = sample_string.dup
    str['veniam'.freeze.freeze] = 'Ruby'.freeze.freeze
    str
  end

  code 'at_index' do
    str = sample_string.dup
    idx = str.index('veniam'.freeze) and str[idx, 'veniam'.freeze.size] = 'Ruby'.freeze
    str
  end

  code '#sub(a, b)' do
    str = sample_string.dup
    str.sub('veniam'.freeze, 'Ruby'.freeze)
  end

  code '#sub!(a, b)' do
    str = sample_string.dup
    str.sub!('veniam'.freeze, 'Ruby'.freeze)
    str
  end

  code '#gsub(a, b)' do
    str = sample_string.dup
    str.gsub('veniam'.freeze, 'Ruby'.freeze)
  end

  code '#gsub!(a, b)' do
    str = sample_string.dup
    str.gsub!('veniam'.freeze, 'Ruby'.freeze)
    str
  end
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
