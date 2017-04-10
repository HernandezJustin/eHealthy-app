class DirectionsController < ApplicationController

  def new
    @recipe = Recipe.find_by(id: params[:id])
    dir_amt = params[:dir_amt].to_i
    if !@recipe.directions
      dir_amt.times do |n|
        Direction.create(
          direction_text: params([:direction_text[n]]),
          recipe_id: @recipe.id
        )
      end
    end
  end

  def edit
    @recipe.directions.each do |dir|
      dir.update(
        direction_text: params[:direction_text],
        recipe_id: @recipe.id
      )
    end
  end
end
