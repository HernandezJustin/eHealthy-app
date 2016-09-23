class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :reviews
  has_many :images
  has_many :directions
  has_many :favorites
  has_many :users, through: :favorites
  has_many :recipe_restrictions
  has_many :diet_restrictions, through: :recipe_restrictions
  has_one :recipe_nutrition
  validates :title, uniqueness: true

  def avg_rating
    total_rating = 0
    reviews.each do |review|
      total_rating += review.rating
    end
    if reviews.empty?
      return 'This recipe has not been reviewed yet'
    else
      @average_rating = total_rating / reviews.count
      # Recipe.update(avg_rating: @average_rating)
    end
  end
end
