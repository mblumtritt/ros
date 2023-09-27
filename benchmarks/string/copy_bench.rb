# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'String:copy - create a String copy' do
  sample = fixture(:lorem_ipsum)

  code '::new' do
    String.new(sample)
  end

  code '#dup' do
    sample.dup
  end

  code '#clone' do
    sample.clone
  end

  # works only for frozen strings
  code '+' do
    +sample
  end

  code '"#{string}"' do
    "#{sample}"
  end
end

RubyOnSpeed.report! __FILE__
