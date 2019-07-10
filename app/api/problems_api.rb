class ProblemsApi < Sinatra::Base
  include Shared

  get %r{/} do
    render_collection(problems)
  end

  private

  def problems
    @problems ||= Problem::View.all
  end
end
