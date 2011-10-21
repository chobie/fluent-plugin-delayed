require 'rake'
require 'rake/testtask'
require 'rake/clean'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "fluent-plugin-delayed"
    gemspec.summary = "Delayed output plugin for Fluent event collector"
    gemspec.author = "Shuhei Taunma"
    gemspec.email = "chobieee@gmail.com"
    gemspec.homepage = "http://fluent.github.com/"
    gemspec.has_rdoc = false
    gemspec.require_paths = ["lib"]
    gemspec.add_dependency "fluentd", "~> 0.10.0"
    gemspec.files = Dir["lib/**/*"] + 
      %w[VERSION AUTHORS Rakefile]
    gemspec.executables = []
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jweler not available. Install it with: gem install jeweler"
end

Rake::TestTask.new(:test) do |t|
  #Todo
end

task :default => [:build]

task :default => [:build, :gemspec]