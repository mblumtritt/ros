# frozen_string_literal: true

require_relative '../../lib/ruby-on-speed'

class CallOrigin
  attr_accessor :value

  def initialize
    @value = 21
  end

  def caller
    CallCaller.new(-> { @value }, ->(arg) { @value = arg })
  end
end

class CallShadow
  attr_reader :origin, :entity, :entity_setter

  def initialize(origin, entity)
    @origin = origin
    @entity = entity
    @entity_setter = "#{entity}="
  end

  def value
    origin.__send__(entity)
  end

  def value=(arg)
    origin.__send__(entity_setter, arg)
  end
end

class CallFaker
  attr_reader :origin

  def initialize(origin, entity)
    @origin = origin
    @entity = "@#{entity}"
  end

  def value
    @origin.instance_variable_get(@entity)
  end

  def value=(arg)
    @origin.instance_variable_set(@entity, arg)
  end
end

class CallCaller
  def initialize(getter, setter)
    @getter = getter
    @setter = setter
  end

  def value
    @getter.call
  end

  def value=(arg)
    @setter.call(arg)
  end
end

RubyOnSpeed.benchmark 'Ruby:forwarding - forward a call' do
  test_truthy_results!

  origin = CallOrigin.new
  shadow = CallShadow.new(origin, :value)
  faker = CallFaker.new(origin, :value)
  caller = origin.caller
  caller2 = CallCaller.new(-> { origin.value }, ->(arg) { origin.value = arg })

  code 'origin#value' do
    origin.value
  end

  code 'origin#value=' do
    origin.value = 42
  end

  code 'shadow#value' do
    shadow.value
  end

  code 'shadow#value=' do
    shadow.value = 42
  end

  code 'faker#value' do
    faker.value
  end

  code 'faker#value=' do
    faker.value = 42
  end

  code 'caller#value' do
    caller.value
  end

  code 'caller#value=' do
    caller.value = 42
  end

  code 'caller2#value' do
    caller2.value
  end

  code 'caller2#value=' do
    caller2.value = 42
  end
end
