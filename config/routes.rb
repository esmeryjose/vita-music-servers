Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :api do
    namespace :v1 do
      get 'auth', to: "sessions#create"
      post 'login', to: "users#create"
      get "sessions/current_user", to: "sessions#show"
      resources :rsvps, only:[:create,:destroy]
      resources :votes, only:[:create, :destroy]
      resources :users, only:[:show] do
        resources :events, only:[:index,:create,:update,:destroy, :show]
      end

      resources :playlists, only:[:show] do
        resources :tracks, only:[:create]
      end
      
      get "search/recommendations/artists", to: "spotify_search#artist"
      get "search/recommendations/tracks", to: "spotify_search#tracks"
      get "search/tracks", to: "spotify_search#tracks"
      get 'search', to: "search#index"
    end
  end
  
end
