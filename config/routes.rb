Rails.application.routes.draw do

  get 'home/about'
  devise_for :users
  root 'top#top'
  resources :books
  resources :users, only: [:index,:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
