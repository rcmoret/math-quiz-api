class ProblemApi < Sinatra::Base
  register Sinatra::Namespace

  namespace %r{/(?<id>\d+)} do
    post '/attempt' do
      if params['success'] == 'true'
        problem.log_success!
      else
        problem.log_failure!
      end
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
