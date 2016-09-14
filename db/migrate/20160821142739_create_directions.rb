class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.integer :recipe_id
      t.text :direction_text

      t.timestamps null: false
    end
  end
end
