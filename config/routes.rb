Rails.application.routes.draw do
  devise_for :users
  root to: "students#index"
  get 'search' => 'countries#search'
  resources :students
  resources :countries, only: [:index, :show]
  resources :home 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
