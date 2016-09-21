class AddApprovalToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :approved, :boolean
  end
end
