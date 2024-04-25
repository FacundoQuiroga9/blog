Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users, controllers: { registrations: 'registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#home"
  resources :posts
  resources :players
  resources :matches, except: [:edit] 

  get 'staff', to: 'pages#staff'
  get 'contact', to: 'pages#contact'

  resources :users do
    get 'user_posts', to: 'posts#user_posts', on: :member
  end

end
