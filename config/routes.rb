Rails.application.routes.draw do
  devise_for :users
  root to: "students#index"
  get 'search' => 'countries#search'
  post "/users/:user_id/countries/:id/save" , to: "countries#trip" , as: :trip_plan
  resources :students
  resources :countries, only: [:index, :show, :destroy]
  resources :home 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
