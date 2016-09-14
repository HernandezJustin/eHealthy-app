class CreateUserRestrictions < ActiveRecord::Migration
  def change
    create_table :user_restrictions do |t|
      t.integer :restriction_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
