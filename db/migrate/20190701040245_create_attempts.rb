class CreateAttempts < ActiveRecord::Migration[5.2]
  def change
    create_table :attempts do |t|
      t.references :problem
      t.boolean :success, null: false

      t.timestamps
    end
  end
end
