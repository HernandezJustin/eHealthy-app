json.id @recipe.id
json.user_id @recipe.user_id
json.title @recipe.title
json.ingredients @recipe.ingredients
json.avg_rating @recipe.avg_rating
json.nutrition_id @recipe.nutrition_id
json.prep_time @recipe.prep_time
json.approved @recipe.approved
json.user_rating @recipe.reviews.find_by(user_id: current_user.id)
json.stars [
  {rating: 1},
  {rating: 2},
  {rating: 3},
  {rating: 4},
  {rating: 5},
]
