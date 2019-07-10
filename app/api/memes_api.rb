class MemesApi < Sinatra::Base
  include Shared

  get %r{/} do
    render_collection(memes)
  end

  private

  def memes
    @memes ||= Meme.all
  end
end
