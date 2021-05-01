Rails.application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => 'users/omniauth_callbacks'}
  resources :users, only: [:show] do
    #nested resource fo students
    resources :students, only: [:show, :index]
  end
  resources :students, only: [:index, :show, :new, :create, :edit, :update, :delete]
  root  to: "home#index"
  post "/users/:user_id/countries/:id/save" , to: "countries#trip" , as: :trip_plan
  get 'search' => 'countries#search'
  resources :countries, only: [:index, :show, :destroy] 
end
