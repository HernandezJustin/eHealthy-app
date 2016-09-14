class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.text :ingredients
      t.integer :avg_rating
      t.integer :nutrition_id
      t.integer :prep_time

      t.timestamps null: false
    end
  end
end
