class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  has_many :recipes
  has_many :reviews
  has_many :favorites
  has_many :favorite_recipes, through: :favorites, source: :recipe
  has_many :user_nutritions
  has_many :recipe_nutritions, through: :user_nutritions
  has_many :user_restrictions
  has_many :diet_restrictions, through: :user_restrictions
  validates :zipcode, length: {is: 5}, numericality: true
end
