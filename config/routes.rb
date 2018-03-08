Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :api do
    namespace :v1 do
      get 'auth', to: "sessions#create"
      post 'login', to: "users#create"
      get "sessions/current_user", to: "sessions#show"
      resources :rsvps, only:[:create,:destroy]
      resources :votes, only:[:create, :destroy]
      resources :users do
        resources :events, only:[:index,:create,:update,:destroy, :show]
      end

      resources :playlists, only:[:show] do
        resources :tracks, only:[:create]
      end
      
      get 'search/index'
    end
  end
  
end
