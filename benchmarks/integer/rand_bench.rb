require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Integer:rand - check 50% chance' do
  has_random_results!

  code '< 50' do
    rand(100) < 50
  end

  code '2#even?' do
    rand(2).even?
  end

  code '100#even?' do
    rand(100).even?
  end
end
