class DietRestriction < ActiveRecord::Base
  has_many :recipe_restrictions
  has_many :recipes, through: :recipe_restrictions
  has_many :user_restrictions
  has_many :users, through: :user_restrictions
end
