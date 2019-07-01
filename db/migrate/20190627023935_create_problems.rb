class CreateProblems < ActiveRecord::Migration[5.2]
  def change
    create_table :problems do |t|
      t.integer :x_value, null: false
      t.integer :y_value, null: false
      t.integer :operator_id, null: false
    end

    add_index :problems, %i[x_value y_value operator_id], unique: true
    add_foreign_key :problems, :operators
  end
end
