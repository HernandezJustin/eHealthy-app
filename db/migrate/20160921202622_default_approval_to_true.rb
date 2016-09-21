class DefaultApprovalToTrue < ActiveRecord::Migration
  def change
    change_column :recipes, :approved, :boolean, default: false
  end
end
