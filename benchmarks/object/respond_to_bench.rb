require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Object:respond_to - test if object responds to' do
  has_truthy_results!

  sample = Class.new { def update! = true }.new

  code '#respond_to?' do
    sample.respond_to?(:update!)
  end

  code 'defined?' do
    defined?(sample.update!)
  end
end

RubyOnSpeed.report! __FILE__
