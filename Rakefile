#!/usr/bin/env rake
require "bundler/gem_tasks"

# added to get Travis-CI to stop complaining about not being able to run 'bundle exec rake'
task :default => [:spec]
desc 'run Rspec specs'
task :spec do
  sh 'rspec spec'
end
