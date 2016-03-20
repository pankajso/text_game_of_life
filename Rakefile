require 'rspec/core/rake_task'

desc 'Task to run unit test specs'

RSpec::Core::RakeTask.new(:unit) do |t|
  t.pattern = './spec/unit/{,/*/**}/*_spec.rb'
end

desc 'Run Unit test specs and generate coverage report'

namespace :coverage do
  desc ""
  task :unit do
    ENV["COVERAGE"] = "enable"
    Rake::Task['unit'].invoke
  end
end

task :default => ["unit"]

