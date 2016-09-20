class UserNutrition < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe_nutrition

  def eat
    recipe = Recipe.find_by(id: params[:id])
    
  end
end
