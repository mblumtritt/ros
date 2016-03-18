task default: :test
BENCHMARKS = FileList.new("#{__dir__}/benchmarks/**/*.rb")
autoload :RubyOnSpeed, "#{__dir__}/lib/ruby_on_speed"
$stdout.sync = $stderr.sync = true

desc 'list all benchmarks'
task list: :load_benchmarks do
  RubyOnSpeed.action = :list
end

desc 'perform benchmarks'
task :benchmark, [:regex] => :load_benchmarks do |_, args|
  RubyOnSpeed.filter! args[:regex]
  RubyOnSpeed.action = :report
end

desc 'compare and find fastest code'
task :compare, [:regex] => :load_benchmarks do |_, args|
  RubyOnSpeed.filter! args[:regex]
  RubyOnSpeed.action = :find_best
end

desc 'compare all - table output'
task :cmp, [:regex] => :load_benchmarks do |_, args|
  RubyOnSpeed.filter! args[:regex]
  RubyOnSpeed.action = :compare
end

desc 'test benchmarks validity (* default)'
task :test, [:regex] => :load_benchmarks do |_, args|
  RubyOnSpeed.filter! args[:regex]
  RubyOnSpeed.action = :test
end

task :load_benchmarks do
  BENCHMARKS.each{ |fname| load fname }
end
