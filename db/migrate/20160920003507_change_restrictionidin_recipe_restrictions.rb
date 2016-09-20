class ChangeRestrictionidinRecipeRestrictions < ActiveRecord::Migration
  def change
    rename_column :recipe_restrictions, :restriction_id, :diet_restriction_id
  end
end
