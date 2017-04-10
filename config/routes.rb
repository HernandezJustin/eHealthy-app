Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  patch '/recipes/:id/approve' => 'recipes#approve'
  get '/profile' => 'profile#home'
  get '/map' => 'profile#map'
  root "recipes#index"
  get '/recipes/:id/nutrition' => 'nutritions#create'
  get '/recipes/:id/nutrition' => 'nutritions#create'
  get '/recipes/:id/directions' => 'directions#new'
  get '/recipes/:id/directions' => 'directions#edit'

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
