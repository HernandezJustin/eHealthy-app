class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def create
    recipe = Recipe.find_by(id: params[:id])
    review = Review.new(
      user_id: current_user.id,
      recipe_id: recipe.id,
      rating: params[:rating]
    )
    review.save
    redirect_to "/recipes"
  end

  def update
    recipe = Recipe.find_by(id: params[:id])
    review = Review.find_by(user_id: current_user.id, recipe_id: recipe.id)
    review.update(
      user_id: current_user.id,
      recipe_id: recipe.id,
      rating: params[:rating]
    )
    redirect_to "/recipes"
  end
end
