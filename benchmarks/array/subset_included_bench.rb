require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Array: subset included' do
  sample_all = [*(1..500)].freeze
  sample_subset = [*(400..500)].freeze

  code '#-#empty?',     ->{ (sample_subset - sample_all).empty? }
  code '#&',            ->{ (sample_subset & sample_all) == sample_subset }
  code '#all?#include?', ->{ sample_subset.all?{ |e| sample_all.include?(e) } }
  code '#all?#index',    ->{ sample_subset.all?{ |e| sample_all.index(e) } }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
