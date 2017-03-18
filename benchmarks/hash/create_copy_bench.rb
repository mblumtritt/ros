require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Hash: create copy' do
  sample_hash = begin
    ary = ('a'..'z').to_a.permutation(2).to_a.map!(&:join)
    Hash[ary.zip(ary)].freeze
  end

  code '::[]', ->{ Hash[sample_hash] }
  code '#dup', ->{ sample_hash.dup }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
