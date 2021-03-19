Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  get "home/about" => "homes#show"
  post 'books' => 'books#create'
  resources :books,only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
