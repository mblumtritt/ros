require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Array: remove nil' do
  sample_array = (Array.new(1000){ |n| n } + Array.new(1000)).shuffle!.freeze

  code '#compact!' do
    ret = Array.new(sample_array)
    ret.compact!
    ret
  end

  code '#reject!' do
    ret = Array.new(sample_array)
    ret.reject!(&:nil?)
    ret
  end

  code '#delete_if' do
    ret = Array.new(sample_array)
    ret.delete_if(&:nil?)
    ret
  end
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
