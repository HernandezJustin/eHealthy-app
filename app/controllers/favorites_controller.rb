class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    recipe = Recipe.find_by(id: params[:id])
    favorite = Favorite.new(
      recipe_id: recipe.id,
      user_id: current_user.id
    )
    favorite.save
    redirect_to "/recipes"
  end

  def destroy
    recipe = Recipe.find_by(id: params[:id])
    favorite = Favorite.find_by(user_id: current_user.id, recipe_id: recipe.id)
    favorite.destroy
    redirect_to "/recipes"
  end
end
