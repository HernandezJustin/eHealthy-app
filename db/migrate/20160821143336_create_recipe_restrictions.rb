class CreateRecipeRestrictions < ActiveRecord::Migration
  def change
    create_table :recipe_restrictions do |t|
      t.integer :recipe_id
      t.integer :restriction_id

      t.timestamps null: false
    end
  end
end
