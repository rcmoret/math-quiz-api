module Shared
  def render_collection(collection)
    [200, collection.shuffle.map(&:to_hash).to_json]
  end
end
