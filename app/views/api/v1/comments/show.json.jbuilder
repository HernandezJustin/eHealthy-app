json.partial! '/api/v1/partials/recipe', recipe: @recipe
json.comments @recipe.comments.order(created_at: :desc).each do |comment|
  json.comment_id comment.id
  json.comment_text comment.comment_text
  json.user_id comment.user_id
  json.commenter comment.user
end
