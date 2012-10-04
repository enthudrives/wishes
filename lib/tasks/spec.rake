require "rspec/core/rake_task"

module RSpec
  module Core
    class RakeTask
      attr_accessor :spec_files

      alias old_files_to_run files_to_run
      def files_to_run
        if spec_files and not ENV["SPEC"]
          spec_files
        else
          old_files_to_run
        end
      end
    end
  end
end

namespace :spec do
  all_specs = FileList["spec/**/*_spec.rb"]
  integration_specs = FileList["spec/**/*_integration_spec.rb"]
  unit_specs = all_specs - integration_specs

  desc "Run unit tests"
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.spec_files = unit_specs
    t.verbose = true
  end

  desc "Run integration tests"
  RSpec::Core::RakeTask.new(:integration) do |t|
    t.spec_files = integration_specs
    t.verbose = true
  end

  desc "Run factory specs"
  RSpec::Core::RakeTask.new(:factory) do |t|
    t.spec_files = FileList["spec/factories_spec.rb"]
    t.verbose = true
  end
end

Rake::Task[:spec].clear
desc "Run all tests"
task :spec => ["spec:factory", "spec:unit", "spec:integration"]
