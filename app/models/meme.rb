class Meme < ActiveRecord::Base
  def to_hash
    attributes.symbolize_keys
  end
end
