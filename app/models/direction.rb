class Direction < ActiveRecord::Base
  belongs_to :recipe
  validates :direction_text, presence: true
end
