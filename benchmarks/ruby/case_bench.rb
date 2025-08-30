require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.benchmark 'Ruby:case - case vs. explicite' do
  Item = Struct.new(:a)

  sample = [
    :sym,
    :sym,
    :some,
    Item.new(1),
    :sym,
    :some,
    Item.new(2),
    :foo,
    :bar
  ].freeze

  code 'case' do
    sample.map do |item|
      case item
      when Item
        1
      when :sym
        2
      when :some
        3
      when :foo
        4
      else
        5
      end
    end
  end

  code 'explicite' do
    sample.map do |item|
      next 1 unless item.is_a?(Symbol)
      next 2 if item == :sym
      next 3 if item == :some
      next 4 if item == :foo
      5
    end
  end
end
