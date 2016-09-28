class Api::V1::FavoritesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  skip_before_action :verify_authenticity_token

  def index
    @recipes = Recipe.where(approved: true)
    if current_user
      @favorites = current_user.favorites
    end
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    favorite = Favorite.find_by(recipe_id: params[:id], user_id: current_user.id)
  end

  def create
    if params[:favorite] == 1
      @recipe = Recipe.find_by(id: params[:id])
      Favorite.create(
        recipe_id: @recipe.id,
        user_id: current_user.id
      )
      render json: {success: "Recipe added to favorites"}
    else
      @recipe = Recipe.find_by(id: params[:id])
      favorite = Favorite.find_by(user_id: current_user.id, recipe_id: @recipe.id)
      favorite.destroy
      render json: {success: "Recipe was deleted from your favorites"}
    end
  end
end
