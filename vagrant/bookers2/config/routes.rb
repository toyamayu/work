Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home/about' => 'books#about', as: 'about'
  
  resources :books 
  resources :users

  root 'books#top'

  
end
