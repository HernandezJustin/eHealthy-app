class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    recipe = Recipe.find_by(id: params[:id])
    Comment.create(
      user_id: current_user.id,
      comment_text: params[:comment_text],
      recipe_id: recipe.id
    )
    redirect_to "/recipes/#{recipe.id}"
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])

    @comment = Comment.find_by(recipe_id: @recipe.id, user_id: current_user.id)
  end

  def update
    recipe = Recipe.find_by(id: params[:id])
    comment = Comment.find_by(recipe_id: recipe.id, user_id: current_user.id)
    comment.update(
      user_id: current_user.id,
      comment_text: params[:comment_text],
      recipe_id: recipe.id
    )
    redirect_to "/recipes/#{recipe.id}"
  end

  def destroy
    recipe = Recipe.find_by(id: params[:id])
    comment = Comment.find_by(recipe_id: recipe.id, user_id: current_user.id)
    comment.destroy
    redirect_to "/recipes/#{recipe.id}"
  end
end
