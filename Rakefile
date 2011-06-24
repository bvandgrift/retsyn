# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'
require 'rake/testtask'
require 'rdoc/task'

Retsyn::Application.load_tasks

require "rspec/core/rake_task" 
require "rspec"


Rake::Task[:default].clear

desc "Default task preps DB, runs specs"
task :default => ['spec']

desc "Run all specs"
RSpec::Core::RakeTask.new(:spec => 'db:test:prepare') do |t|
  t.pattern = "spec/**/*_spec.rb"
  t.ruby_opts = '-Ilib -Ispec -I.'
end
