# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Ruby:any - single test vs. any' do
  def test_dedicated
    1.even? || 3.even? || 5.even? || 7.even?
  end

  def test_any(*args)
    args.any?(&:even?)
  end

  code 'dedicated' do
    test_dedicated
  end

  code 'any' do
    test_any(1, 3, 5, 7)
  end
end

RubyOnSpeed.report! __FILE__
