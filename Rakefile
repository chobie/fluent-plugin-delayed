require 'rake'
require 'rake/testtask'
require 'bundler'
Bundler::GemHelper.install_tasks

Rake::TestTask.new(:test) do |t|
  t.test_files = Dir['test/plugin/*.rb']
  t.ruby_opts = ['-rubygems'] if defined? Gem
  t.ruby_opts << '-I.'
end

task :default => [:build]
