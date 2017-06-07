require_relative '../../lib/ruby_on_speed'

RubyOnSpeed.test 'Ruby: variable vs. constant result' do
  sample = Class.new do
    def initialize
      @var = 21
    end

    def const
      21
    end

    def use_var
      @var + @var
    end

    def use_const
      const + const
    end
  end.new

  code '@var',   ->{ sample.use_var }
  code '#const', ->{ sample.use_const }
end

RubyOnSpeed.report! if __FILE__ == $PROGRAM_NAME
