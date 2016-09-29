class RecipeNutrition < ActiveRecord::Base
  has_many :user_nutritions
  has_many :users, through: :user_nutritions
  belongs_to :recipe
  validates :fat, numericality: true
  validates :protein, numericality: true
  validates :carbs, numericality: true
  validates :calories, numericality: true
  validates :cholesterol, numericality: true
end
