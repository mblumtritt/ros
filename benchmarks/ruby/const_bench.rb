# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

RubyOnSpeed.test 'Ruby: CONST access' do
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

  code 'direct',        ->{ ConstC.check(21) }
  code 'class.CONST',   ->{ ConstA2.check(21) }
  code 'module.CONST',  ->{ ConstA.check(21) }
  code 'module::CONST', ->{ ConstB.check(21) }
  code 'class::CONST',  ->{ ConstB2.check(21) }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
