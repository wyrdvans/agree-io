Agree::Application.routes.draw do

  resources :revisions
  resources :signatures
  resources :participants
  resources :terms
  resource :session

  get '/auth/:provider/callback', to: 'sessions#create'

  root to: 'terms#new'

end
