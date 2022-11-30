Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "pages#landing"
  get '/message_test', to: 'pages#message_test'
  get '/start_dm/:id', to: 'initiate_dm#initiate'
  get '/newuser', to: 'pages#new_user', as: :new_signup
  get 'artists/new_guidelines', to: 'artists#new_artist_guidelines', as: :new_artist_guidelines
  get 'artists/create_confirmation', to: 'artists#new_artist_confirmation', as: :new_artist_confirmation

  resources :artists do
    resources :reviews, only: %i[new create]
    resources :bookings, only: %i[new create]
  end

  resources :bookings, except: %i[new create]
  resources :dm_rooms do
    resources :messages, only: :create
  end
  # add destroy to messages

  resources :user_dms, only: %i[new create destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
