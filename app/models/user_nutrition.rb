class UserNutrition < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe_nutrition
end
