Rails.application.routes.draw do
  resources :comments
  resources :posts
  devise_for :users

  devise_scope :user do  
    post '/users/sign_out' => 'devise/sessions#destroy'     
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  resources :posts do
    resources :comments, only: [:create]
  end
end
