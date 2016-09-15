class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    if current_user
    @fav_check = @recipe.favorites.where(user_id: current_user.id)
    @rev_check = @recipe.reviews.find_by(user_id: current_user.id, recipe_id: @recipe.id)
    end
  end

  def new
    @recipe = Recipe.new
  end

  def favorite
    recipe = Recipe.find_by(id: params[:id])
    current_user.favorites << recipe
    redirect_to "/recipes"
  end

  def create
    @recipe = Recipe.new(
      user_id: current_user.id,
      title: params[:title],
      ingredients: params[:ingredients],
      prep_time: params[:prep_time]
    )
    @recipe.save
    redirect_to "/recipes"
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.update(
      user_id: current_user.id,
      title: params[:title],
      ingredients: params[:ingredients],
      prep_time: params[:prep_time]
    )
    redirect_to '/recipes'
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    redirect_to '/recipes'
  end
end
