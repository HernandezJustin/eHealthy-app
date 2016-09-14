class CreateRecipeNutritions < ActiveRecord::Migration
  def change
    create_table :recipe_nutritions do |t|
      t.integer :fat
      t.integer :calories
      t.integer :carbs
      t.integer :cholesterol
      t.integer :protein
      t.integer :recipe_id

      t.timestamps null: false
    end
  end
end
