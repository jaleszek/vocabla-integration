require "cucumber/rake/task"
require "rake/clean"

CLEAN.include('*.log','*.png', '*.jpg', '*.html')

Cucumber::Rake::Task.new(:test) do |task|
  task.cucumber_opts = (" features/*.feature")
end

