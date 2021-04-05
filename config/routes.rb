Rails.application.routes.draw do
  root to: 'home#index'
  get '/search' => 'home#search'
  resources :courses  
  resources :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
