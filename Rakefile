require 'rake'
require 'standalone_migrations'

StandaloneMigrations::Tasks.load_tasks

task default: 'app:start'
task console: 'app:console'
task seed_problems: 'app:seed_problems'
task reset_attempts: 'app:reset_attempts'
task reset_problems: 'app:reset_problems'

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
    require './app/models/meme'
    require './app/models/operator'
    require './app/models/problem/base'
    require './app/models/problem/addition'
    require './app/models/problem/attempt'
    require './app/models/problem/division'
    require './app/models/problem/multiplication'
    require './app/models/problem/subtraction'
    require './app/models/problem/view'
    require './app/shared.rb'
    require './app/api/memes_api'
    require './app/api/problem_api'
    require './app/api/problems_api'
  end

  desc 'reset the problems'
  task reset_problems: :setup do
    [Problem::Addition, Problem::Subtraction, Problem::Division, Problem::Multiplication].each do |klass|
      klass.destroy_all
    end
  end

  desc 'seeding the problems'
  task seed_problems: :setup do
    [Problem::Addition, Problem::Subtraction, Problem::Division, Problem::Multiplication].each do |klass|
      klass::X_RANGE.to_a.each do |x|
        klass::Y_RANGE.to_a.each do |y|
          problem = klass.new(x_value: x, y_value: y)
          if problem.valid?
            problem.save
          else
            problem.errors.each do |error, message|
              puts "#{error}: #{message}"
            end
          end
        end
      end
    end
  end

  desc 'reset the attempt count'
  task reset_attempts: :setup do
    Problem::Attempt.destroy_all
  end
end
