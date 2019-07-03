module Shared
  def render_collection(collection)
    [200, collection.map(&:to_hash).to_json]
  end
end
