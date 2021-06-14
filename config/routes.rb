Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books
      get '/books/user/:id', to: 'books#user_books'
      resources :users, only: [:show, :create, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
