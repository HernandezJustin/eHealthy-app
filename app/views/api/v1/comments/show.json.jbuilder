json.id @recipe.id
json.user_id @recipe.user_id
json.title @recipe.title
json.ingredients @recipe.ingredients
json.avg_rating @recipe.avg_rating
json.nutrition_id @recipe.nutrition_id
json.prep_time @recipe.prep_time
json.approved @recipe.approved
json.comments @recipe.comments.where(recipe_id: @recipe.id)
