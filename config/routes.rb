Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "pages#landing"
  get '/yeet', to: 'pages#special', as: :special_page_path
  get 'artists/new_guidelines', to: 'artists#new_guidelines', as: :new_artist_guidelines
  get 'artists/create_confirmation', to: 'artists#new_confirmation', as: :new_artist_confirmation
  resources :artists do
    resources :reviews, only: %i[new create]
    resources :bookings, only: %i[new create]
  end
  resources :bookings, except: %i[new create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
