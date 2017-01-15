Rails.application.routes.draw do
  root to: 'visitors#index'
  match '/users/:id/finish_signup' => 'visitors#index', via: [:get, :patch], :as => :finish_signup
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users
  resources :events
  resources :endorsements

end
