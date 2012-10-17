Wishes::Application.routes.draw do
  resources :wishes do
    member do
      get 'vote'
      get 'unvote'
    end
  end

  match '/auth/github/callback' => 'sessions#create'
  match '/signout' => 'sessions#destroy'

  root to: "wishes#index"
end
