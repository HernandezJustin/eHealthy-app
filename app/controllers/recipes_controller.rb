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

  def create
    @recipe = Recipe.new(
      user_id: current_user.id,
      title: params[:title],
      ingredients: params[:ingredients],
      prep_time: params[:prep_time]
    )
    if @recipe.save
      flash[:success] = "Recipe was successfully created"
    else
      flash[:warning] = @recipe.errors.full_messages
    end
    redirect_to "/recipes/#{@recipe.id}"
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
      prep_time: params[:prep_time],
      avg_rating: @recipe.avg_rating
    )
    if @recipe.save
      flash[:success] = "Recipe was successfully updated"
    else
      flash[:warning] = @recipe.errors.full_messages
    end
    redirect_to "/recipes/#{@recipe.id}"
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    if @recipe.destroy
      flash[:info] = "Recipe was successfully removed"
    else
      flash[:warning] = @recipe.errors.full_messages
    end
    redirect_to '/recipes'
  end
end
