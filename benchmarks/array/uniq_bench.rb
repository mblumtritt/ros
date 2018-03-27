require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Array: unique values' do
  sample_array = Array.new(1000){ Object.new }
  sample_array += sample_array
  sample_array.freeze

  code 'uniq' do
    sample_array.uniq
  end

  code 'copy#uniq!' do
    ret = Array.new(sample_array)
    ret.uniq!
    ret
  end

  code 'use hash' do
    sample_array.map{ |e| [e, true] }.to_h.keys
  end
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
