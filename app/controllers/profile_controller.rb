class ProfileController < ApplicationController
  before_action :authenticate_user!
  def home
    if current_user.admin
      @recipes = Recipe.where(approved: false)
    end
  end
end
