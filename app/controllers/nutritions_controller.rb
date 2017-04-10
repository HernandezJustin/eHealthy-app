class NutritionsController < ApplicationController

  def create
    @recipe = Recipe.find_by(id: params[:id])
    if !@recipe.recipe_nutrition
      RecipeNutrition.create(
        fat: params[:fat],
        calories: params[:calories],
        carbs: params[:carbs],
        cholesterol: params[:cholesterol],
        protein: params[:protein],
        recipe_id: @recipe.id
      )
    else
      nutrition = @recipe.recipe_nutrition
      nutrition.update(
        fat: params[:fat],
        calories: params[:calories],
        carbs: params[:carbs],
        cholesterol: params[:cholesterol],
        protein: params[:protein],
        recipe_id: @recipe.id
      )
    end
  end
end
