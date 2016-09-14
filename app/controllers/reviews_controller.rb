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
  end
end
