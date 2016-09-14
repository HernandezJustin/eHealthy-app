class RecipeRestriction < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :diet_restriction
end
