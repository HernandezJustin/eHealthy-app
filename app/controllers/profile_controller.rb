class ProfileController < ApplicationController
  def home
    if current_user.admin
      @recipes = Recipe.where(approved: false)
    end
  end
end
