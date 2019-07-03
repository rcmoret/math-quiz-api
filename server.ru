use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: %i(get post put options delete)
  end
end

map '/problem' do
  run ProblemApi.new
end

map '/problems' do
  run ProblemsApi.new
end
