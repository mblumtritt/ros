task default: :test
BENCHMARKS = FileList.new("#{__dir__}/benchmarks/**/*.rb")
autoload :RubyOnSpeed, "#{__dir__}/lib/ruby_on_speed"
$stdout.sync = $stderr.sync = true

desc 'list all benchmarks'
task list: :load_benchmarks do
  RubyOnSpeed.action = :list
end

desc 'perform benchmarks (* default)'
task :benchmark, [:regex] => :load_benchmarks do |_, args|
  RubyOnSpeed.filter! args[:regex]
  RubyOnSpeed.action = :report
end

desc 'compare and find fastest code'
task :compare, [:regex] => :load_benchmarks do |_, args|
  RubyOnSpeed.filter! args[:regex]
  RubyOnSpeed.action = :find_best
end

desc 'test benchmarks validity'
task :test, [:regex] => :load_benchmarks do |_, args|
  RubyOnSpeed.filter! args[:regex]
  RubyOnSpeed.action = :test
end

task :load_benchmarks do
  BENCHMARKS.each{ |fname| load fname }
end
