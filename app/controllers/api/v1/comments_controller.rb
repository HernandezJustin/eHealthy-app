class Api::V1::CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  before_action :profanity_check
  skip_before_action :verify_authenticity_token

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
    @recipe = Recipe.find_by(id: params[:id])
    comment = Comment.find_by(user_id: current_user.id, recipe_id: @recipe.id)
    comment.update(
      comment_text: params[:comment_text]
    )
    if comment.save
      @recipe = comment.recipe
      render 'show'
    else
      render json: { error: comment.errors.full_messages }
    end
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    comment = Comment.find_by(recipe_id: @recipe.id, user_id: current_user.id)
    if comment.destroy
      render json: { success: 'nice day'}
    else
      render json: { error: comment.errors.full_messages }
    end
  end

  private

  def profanity_check
    profanity_filter = LanguageFilter::Filter.new
    profanity_filter.sanitize(params[:comment_text])
  end
end
