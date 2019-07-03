class ProblemsApi < Sinatra::Base
  # register Sinatra::Namespace
  include Shared

  get %r{/} do
    render_collection(problems)
  end

  private

  def problems
    Problem::View.all
  end
end
