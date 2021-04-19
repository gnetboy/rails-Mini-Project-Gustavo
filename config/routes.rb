Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get 'search' => 'country#search'
  resources :home 
  resources :students
  resources :countries 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
