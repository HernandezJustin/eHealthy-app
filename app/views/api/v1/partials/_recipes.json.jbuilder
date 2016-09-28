json.array! @recipes.each do |recipe|
  json.id recipe.id
  json.user_id recipe.user_id
  json.title recipe.title
  json.ingredients recipe.ingredients
  json.avg_rating recipe.avg_rating
  json.nutrition_id recipe.nutrition_id
  json.prep_time recipe.prep_time
  json.approved recipe.approved
  json.favorite recipe.favorites.find_by(user_id: current_user.id, recipe_id: recipe.id) if current_user
  json.first_img recipe.images.first.link
end
