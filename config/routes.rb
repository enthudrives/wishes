Wishes::Application.routes.draw do
  root to: "wishes#index"
  resources :wishes do
    member do
      post "upvote"
      post "downvote"
    end
  end
end
