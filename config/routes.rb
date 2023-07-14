Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: {
           :registrations => "users/registrations" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"
  resource :users
  resource :share, only: [:new, :create]
end
