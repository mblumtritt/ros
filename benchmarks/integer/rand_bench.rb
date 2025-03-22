# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Integer:rand - check 50% chance' do
  has_random_results!

  code '< 0.5' do
    rand < 0.5
  end

  code '2#even?' do
    rand(2).even?
  end

  code '2#zero?' do
    rand(2).zero?
  end

  code '< 50' do
    rand(100) < 50
  end

  code '100#even?' do
    rand(100).even?
  end

  code '2#==' do
    rand(2) == 0
  end
end
