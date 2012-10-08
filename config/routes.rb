Wishes::Application.routes.draw do
  resources :wishes
  resources :sections

  match '/auth/github/callback' => 'sessions#create'

  root to: "wishes#index"
end
