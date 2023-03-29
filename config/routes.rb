Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "pages#landing"

  get '/newuser', to: 'pages#new_user', as: :new_signup
  get 'artists/:id/bookings/confirmed', to: 'bookings#confirmation', as: :confirmation_booking
  get 'artists/new_guidelines', to: 'artists#new_artist_guidelines', as: :new_artist_guidelines
  get 'artists/create_confirmation', to: 'artists#new_artist_confirmation', as: :new_artist_confirmation
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  get '/artists/:id/message', to: 'message_rooms#create', as: :new_chat
  get '/message_rooms/access_denied', to: 'message_rooms#denied', as: :room_access_denied
  get '/artist_already_created', to: 'artists#artist_already_exists', as: :artist_already_exists
  get '/booking/:id/confirm_as_artist', to: 'bookings#confirm', as: :confirm_booking
  get '/calendar', to: 'pages#calendar', as: :calendar

  resources :artists do
    resources :reviews, only: %i[new create index]
    resources :bookings, only: %i[new create]
    resources :user_likes, only: %i[create]
  end

  resources :user_likes, only: %i[index destroy]

  resources :bookings, except: %i[new create]
  resources :message_rooms, only: %i[index show] do
    resources :messages, only: :create
  end
  # add destroy to messages
  resources :orders, only: %i[show create] do
    resources :payments, only: :new
  end

  resources :user_dms, only: %i[new create destroy]
  mount StripeEvent::Engine, at: '/stripe-webhooks'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
