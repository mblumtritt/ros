# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

module ModuleA
  CONST = 21

  def self.check(arg)
    CONST + arg
  end
end

module ModuleB
  CONST = 21

  def self.check(arg)
    self::CONST + arg
  end
end

module ModuleC
  def self.check(arg)
    21 + arg
  end
end

class ClassA
  CONST = 21

  def self.check(arg)
    CONST + arg
  end
end

class ClassB
  CONST = 21

  def self.check(arg)
    self::CONST + arg
  end
end

RubyOnSpeed.benchmark 'Ruby:CONST - using a constant' do
  code 'direct' do
    ModuleC.check(21)
  end

  code 'module.CONST' do
    ModuleA.check(21)
  end

  code 'class.CONST' do
    ClassA.check(21)
  end

  code 'module::CONST' do
    ModuleB.check(21)
  end

  code 'class::CONST' do
    ClassB.check(21)
  end
end
