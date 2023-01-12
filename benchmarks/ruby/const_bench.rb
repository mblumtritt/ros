# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby:CONST - using a constant' do
  module ConstA
    CONST = 21

    def self.check(x)
      CONST + x
    end
  end

  module ConstB
    CONST = 21

    def self.check(x)
      self::CONST + x
    end
  end

  class ConstA2
    CONST = 21

    def self.check(x)
      CONST + x
    end
  end

  class ConstB2
    CONST = 21

    def self.check(x)
      self::CONST + x
    end
  end

  module ConstC
    def self.check(x)
      21 + x
    end
  end

  code 'direct' do
    ConstC.check(21)
  end

  code 'class.CONST' do
    ConstA2.check(21)
  end

  code 'module.CONST' do
    ConstA.check(21)
  end

  code 'module::CONST' do
    ConstB.check(21)
  end

  code 'class::CONST' do
    ConstB2.check(21)
  end
end

RubyOnSpeed.report! __FILE__
