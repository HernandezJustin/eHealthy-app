class CreateUserNutritions < ActiveRecord::Migration
  def change
    create_table :user_nutritions do |t|
      t.integer :nutrition_id
      t.integer :user_id
      t.date :date

      t.timestamps null: false
    end
  end
end
