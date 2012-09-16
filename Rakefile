#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Wishes::Application.load_tasks

require "rspec/core/rake_task"
namespace :spec do |ns|
  desc "Run unit tests"
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = "spec/unit/**/*_spec.rb"
    t.verbose = true
  end

  desc "Run integration tests"
  RSpec::Core::RakeTask.new(:integration) do |t|
    t.pattern = "spec/integration/**/*_spec.rb"
    t.verbose = true
  end
end

Rake::Task[:spec].clear
desc "Run all tests"
task :spec => ["spec:unit", "spec:integration"]

