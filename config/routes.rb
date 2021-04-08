Rails.application.routes.draw do
  get '/search' => 'home#search'
  resources :home 
  resources :students
  resources :countries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
