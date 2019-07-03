class ProblemApi < Sinatra::Base
  register Sinatra::Namespace

  namespace %r{/(?<id>\d+)} do
    put '/log_success' do
      problem.log_success!
      [201, {}.to_json]
    end

    put '/log_failure' do
      problem.log_failure!
      [201, {}.to_json]
    end

    private

    def id
      @id ||= params['id']
    end

    def problem
      @problem ||= Problem::Base.find(id).as_subclass
    end
  end
end
