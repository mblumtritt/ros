require_relative './lib/ruby_on_speed'

$stdout.sync = $stderr.sync = true

task default: :list

desc 'list all benchmarks (* default)'
task list: :load_benchmarks do
  puts 'All registered benachmarks:', nil
  RubyOnSpeed.names.each{ |name| puts(name) }
end

desc 'perform benchmarks'
task :bench, [:regex] => :load_benchmarks do |_, args|
  RubyOnSpeed.filter! args[:regex]
  RubyOnSpeed.report!
end

desc 'compare and find fastest code'
task :compare, [:regex] => :load_benchmarks do |_, args|
  RubyOnSpeed.filter! args[:regex]
  RubyOnSpeed.find_best!
end

desc 'compare all - table output'
task :cmp, [:regex] => :load_benchmarks do |_, args|
  RubyOnSpeed.filter! args[:regex]
  RubyOnSpeed.compare!
end

desc 'test benchmarks validity'
task :test, [:regex] => :load_benchmarks do |_, args|
  RubyOnSpeed.filter! args[:regex]
  exit RubyOnSpeed.test!.zero?
end

task :load_benchmarks do
  FileList.new("#{__dir__}/benchmarks/**/*_bench.rb").to_a.sort!.each{ |fname| load fname }
end
