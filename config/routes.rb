Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  patch '/recipes/:id/approve' => 'recipes#approve'
  get '/profile' => 'profile#home'
  get '/map' => 'profile#map'
  root "recipes#index"
  post "recipes/:id/favorite" => 'favorites#create'
  delete "recipes/:id/unfavorite" => 'favorites#destroy'
  post "recipes/:id/comment" => 'comments#create'
  get "recipes/:id/fixcomment" => 'comments#edit'
  patch "recipes/:id/updatecomment" => 'comments#update'
  post "recipes/:id/rate" => 'reviews#create'
  patch "recipes/:id/rerate" => 'reviews#update'
  delete "recipes/:id/uncomment" => 'comments#destroy'

  namespace :api do
    namespace :v1 do
      get '/reviews/:id' => 'reviews#show'
      post '/reviews/:id' => 'reviews#create'
      get '/comments/:id' => 'comments#show'
      post '/comments/:id' => 'comments#create'
      patch '/comments/:id' => 'comments#update'
      delete '/comments/:id' => 'comments#destroy'
      get '/favorites' => 'favorites#index'
      get '/favorites/:id' => 'favorites#show'
      post '/favorites/:id' => 'favorites#create'
    end
  end

end
