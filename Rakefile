require 'rake'
require 'standalone_migrations'

StandaloneMigrations::Tasks.load_tasks

task default: 'app:start'
task console: 'app:console'

namespace :app do
  desc 'Start application'
  task start: :setup do
    Rack::Server.start(config: './server.ru', Host: '0.0.0.0', Port: 4040)
  end

  desc 'Start application console'
  task console: :setup do
    require 'irb'
    require 'irb/completion'
    ARGV.clear
    IRB.start
  end

  desc 'loading, requiring files'
  task :setup do
    ENV['RACK_ENV'] = 'development'
    require 'bundler/setup'
    Bundler.require(:development)
    require './config/environments'
    require './app/models/operator'
    require './app/models/problem/base'
    require './app/models/problem/addition'
    require './app/models/problem/attempt'
    require './app/models/problem/division'
    require './app/models/problem/multiplication'
    require './app/models/problem/subtraction'
    require './app/models/problem/view'
  end
end
