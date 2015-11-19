module RubyOnSpeed
  NAME = name
  VERSION = '0.1.1'
  ACTION = 'test'
  Error = Class.new(StandardError)
  Skipped = Class.new(StandardError)

  require_relative 'ruby_on_speed/register'
  require_relative 'ruby_on_speed/benchmark'
  autoload :Reporter, "#{__dir__}/ruby_on_speed/reporter"

  Registered = Register.new

  class << self

    def check
      block_given? or raise('no block given')
      create(Proc.new)
    end
    alias benchmark check

    def nop!
      # NOP
    end
    alias ignore nop!
    alias check_not nop!
    alias xcheck nop!

    def action=(action)
      ACTION.replace(action.to_s)
    end

    def action!
      send "#{ACTION}!"
    end

    def filter!(regexp)
      regexp or return
      regexp = Regexp.new(regexp)
      Registered.keep_if{ |name| regexp =~ name }
    rescue RegexpError => e
      self.action = :nop
      abort "ERROR: #{e}"
    end

    private

    def list!
      Registered.names.each{ |name| $stdout.puts name }
    end

    def test!
      Registered.each{ |bm| test bm }
    end

    def report!
      run Reporter.create(:default)
    end

    def find_best!
      run Reporter.create(:progress)
    end

    def create(proc)
      bm = Benchmark.new
      bm.instance_exec(&proc)
      Registered.add(bm)
    end

    def test(bm)
      $stdout.print "#{bm} ..."
      bm.test!
      $stdout.puts 'ok'
    rescue Skipped => e
      $stdout.puts "skipped - #{e}"
    rescue Error => e
      $stdout.puts "error - #{e}"
    end

    def run(reporter)
      entries = Registered.size
      entries.zero? and return
      reporter.start(entries)
      Registered.each{ |bm| bm.go!(reporter) }
    rescue Interrupt
      $stderr.puts ' ABORTED'
    end
  end

  at_exit{ RubyOnSpeed.action! }
end
