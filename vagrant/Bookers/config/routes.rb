Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :books
root 'books#top'
# get 'books/new'
# post 'books' => 'books#create'
# patch 'books/:id' => 'books#update', as:'update_book'
delete 'books/:id' => 'books#destroy', as: 'destroy_book'
 

end
