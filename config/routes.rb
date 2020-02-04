Rails.application.routes.draw do

  resources :bloggers
  
  resources :destinations

  resources :posts
  post "/posts/:id/increase_likes", to: "posts#increase_likes", as: "increase_likes"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
