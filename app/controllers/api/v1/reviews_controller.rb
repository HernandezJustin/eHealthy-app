class Api::V1::ReviewsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def create
    @recipe = Recipe.find_by(id: params[:id])
    review = Review.find_by(user_id: current_user.id, recipe_id: @recipe.id)
    if review
      review.update(rating: params[:rating])
    else
    Review.create(
      user_id: current_user.id,
      recipe_id: @recipe.id,
      rating: params[:rating]
    )
    end
    @recipe.update(
      avg_rating: @recipe.avg_rating
    )
    render 'show'
  end
end
