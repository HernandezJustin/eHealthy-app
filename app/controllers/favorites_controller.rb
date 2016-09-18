class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    recipe = Recipe.find_by(id: params[:id])
    favorite = Favorite.new(
      recipe_id: recipe.id,
      user_id: current_user.id
    )
    if favorite.save
      flash[:success] = "Added this recipe to favorites!"
    else
      flash[:warning] = favortite.errors.full_messages
    end
    redirect_to "/recipes/#{recipe.id}"
  end

  def destroy
    recipe = Recipe.find_by(id: params[:id])
    favorite = Favorite.find_by(user_id: current_user.id, recipe_id: recipe.id)
    if favorite.destroy
      flash[:info] = "Removed this recipe from your favorites!"
    else
      flash[:warning] = favortite.errors.full_messages
    end
    redirect_to "/recipes/#{recipe.id}"
  end
end
