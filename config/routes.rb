Rails.application.routes.draw do
  resources :enrollments
  resources :subjects
  resources :houses
  resources :users
  resources :sessions

  post '/logout', to: "users#logout", as: "logout"
  get '/professors', to: "users#professors"
  get '/students', to: "users#students"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
