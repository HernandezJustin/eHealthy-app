json.partial! '/api/v1/partials/recipe', recipe: @recipe
json.user_rating @recipe.reviews.find_by(user_id: current_user.id)
json.stars [
  {rating: 1},
  {rating: 2},
  {rating: 3},
  {rating: 4},
  {rating: 5},
]
