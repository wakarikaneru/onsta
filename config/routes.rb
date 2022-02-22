Rails.application.routes.draw do

  namespace :admin do
    resources :users
    resources :tweets

    root to: "users#index"
  end
    
  devise_for :users, controllers: {
        sessions:      'users/sessions',
        passwords:     'users/passwords',
        registrations: 'users/registrations'
    }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "tweets#index"

  get 'cgi/community2/rbbs.cgi', to: 'application#turi'

  resources :tweets
  resources :users

end
