class ProblemsApi < Sinatra::Base
  include Shared

  get %r{/} do
    sleep 1.5
    render_collection(problems)
  end

  private

  def problems
    Problem::View.all
  end
end
