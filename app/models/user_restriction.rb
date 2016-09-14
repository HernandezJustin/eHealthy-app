class UserRestriction < ActiveRecord::Base
  belongs_to :user
  belongs_to :diet_restriction
end
