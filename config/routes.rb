Agree::Application.routes.draw do

  resources :revisions
  resources :signatures
  resources :participants
  resources :terms

  root to: 'terms#new'

end
