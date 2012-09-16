require "rspec/core/rake_task"
namespace :spec do
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

  desc "Run factory specs"
  RSpec::Core::RakeTask.new(:factory) do |t|
    t.pattern = './spec/factories_spec.rb'
    t.verbose = true
  end

  task :integration => :factory
end

Rake::Task[:spec].clear
desc "Run all tests"
task :spec => ["spec:unit", "spec:integration"]
