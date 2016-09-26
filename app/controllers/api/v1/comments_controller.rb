class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_user!, :profanity_check

  def show
    @recipe = Recipe.find_by(id: params[:id])
    comments = Comment.where(recipe_id: params[:id])
  end

  def create
    comment = Comment.new(
      comment_text: params[:comment_text],
      recipe_id: params[:recipe_id],
      user_id: current_user.id
    )
    if comment.save
      @recipe = comment.recipe
      render 'show'
    else
      render json: { error: "Comment can't be blank" }, status: 422
    end
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
    if comment.save
      flash[:success] = "Your comment was updated!"
    else
      flash[:warning] = comment.errors.full_messages
    end
    redirect_to "/recipes/#{recipe.id}"
  end

  def destroy
    recipe = Recipe.find_by(id: params[:id])
    comment = Comment.find_by(recipe_id: recipe.id, user_id: current_user.id)
    if comment.destroy
      flash[:info] = "Your comment was deleted!"
    else
      flash[:warning] = comment.errors.full_messages
    end
    redirect_to "/recipes/#{recipe.id}"
  end

  private

  def profanity_check
    profanity_filter = LanguageFilter::Filter.new
    profanity_filter.sanitize(params[:comment_text])
  end
end
