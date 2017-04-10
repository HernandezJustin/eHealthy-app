class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.string :direction_text,
      t.integer, :recipe_id
      t.integer :direction_num

      t.timestamps null: false
    end
  end
end
