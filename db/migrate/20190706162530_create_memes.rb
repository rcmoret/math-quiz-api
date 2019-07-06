class CreateMemes < ActiveRecord::Migration[5.2]
  def change
    create_table :memes do |t|
      t.string :url, limit: 200, null: false
      t.integer :width, null: false
      t.integer :height, null: false
      t.boolean :success, null: false

      t.timestamps
    end
  end
end
