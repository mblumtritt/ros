require_relative '../../lib/ruby_on_speed'
require 'date'

RubyOnSpeed.test 'Array: sort' do
  sample_array = (Date.new(2000)..Date.new(2015)).to_a.shuffle!.freeze

  code '#sort_by',  ->{ sample_array.sort_by(&:julian) }
  code '#sort',     ->{ sample_array.sort{ |a, b| a.julian <=> b.julian } }
  code '#sort_by!', ->{ Array.new(sample_array).sort_by!(&:julian) }
  code '#sort!',    ->{ Array.new(sample_array).sort!{ |a, b| a.julian <=> b.julian } }
end

RubyOnSpeed.report! if $0 == __FILE__
