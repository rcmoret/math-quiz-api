class AddNameToMeme < ActiveRecord::Migration[5.2]
  def change
    add_column :memes, :name, :string, limit: 100
  end
end
