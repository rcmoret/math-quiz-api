class CreateOperators < ActiveRecord::Migration[5.2]
  def change
    create_table :operators do |t|
      t.string :name, null: false, limit: 20
      t.string :symbol, null: false, limit: 1
    end

    add_index :operators, :name, unique: true
    add_index :operators, :symbol, unique: true
  end
end
