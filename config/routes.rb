Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :api do
    namespace :v1 do
      get 'auth', to: "sessions#create"
      post 'login', to: "users#create"
      get "sessions/current_user", to: "sessions#show"
      resources :rsvps
      resources :votes
      resources :tracks
      resources :playlists
      resources :events
      get 'search/index'
    end
  end
  
end
