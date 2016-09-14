Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  get '/profile' => 'profile#home'
  root "recipes#index"
  post "recipes/:id/favorite" => 'favorites#create'
  delete "recipes/:id/unfavorite" => 'favorites#destroy'
  post "recipes/:id/comment" => 'comments#create'
  get "recipes/:id/fixcomment" => 'comments#edit'
  patch "recipes/:id/updatecomment" => 'comments#update'
  post "recipes/:id/rate" => 'reviews#create'
  delete "recipes/:id/uncomment" => 'comments#destroy'
end
