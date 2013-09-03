require File.expand_path('../config/application', __FILE__)
Rails4Flickrapi::Application.load_tasks

desc 'Runs the higher-level acceptance tests'
task :acceptance do
  exec 'foreman run bundle exec rspec acceptance_test'
end
