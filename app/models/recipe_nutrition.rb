class RecipeNutrition < ActiveRecord::Base
  has_many :user_nutritions
  has_many :users, through: :user_nutritions
  belongs_to :recipe
end
