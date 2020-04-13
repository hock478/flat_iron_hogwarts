Rails.application.routes.draw do
  resources :enrollments
  resources :subjects
  resources :houses
  resources :users
  resources :sessions

  post '/logout', to: "users#logout", as: "logout"
  get '/professors', to: "users#professors"
  get '/students', to: "users#students"
  get '/students/:id/edit_subjects', to: "users#edit_subjects", as: 'edit_subjects'
  post '/students/:id', to: "users#update_subjects", as: 'update_subjects'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
