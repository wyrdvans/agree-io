Agree::Application.routes.draw do

  resources :revisions
  resources :signatures
  resources :participants
  resources :terms
  resource :session

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'

  root to: 'terms#new'

end
