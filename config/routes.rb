Rails.application.routes.draw do
  resources :friends
  resources :likes
  resources :comments
  resources :posts
  resources :enrollments
  resources :subjects
  resources :houses
  resources :users
  # resources :sessions

  get '/login' => "sessions#new", as: 'login'
  post '/logout', to: "sessions#destroy", as: "logout"
  get '/professors', to: "users#professors"
  get '/students', to: "users#students"
  get '/students/:id/edit_subjects', to: "users#edit_subjects", as: 'student_edit_subjects'
  post '/students/:id', to: "users#update_subjects", as: 'update_subjects'
  post '/enrollments/:id', to: "enrollments#destroy_student", as: 'enrollment_student'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', to: "users#home", as: "home"

  post '/login', to: "sessions#create"
  # post 'games/:id/buy', to: "games#buy"
  # post '/logout', to: "sessions#destroy", as: "logout"

  # get '/professors/:id/edit_courses', to: 'users#edit_courses'
  post '/professors/:id/', to: "subjects#update_courses", as: "update_course"

  post '/add_points/:id', to: "houses#add_points", as: "add_points"
  get '/users/:id/sorted', to: "users#sorting", as: "sorting_hat"
  post 'sorted', to: "users#sorted"
  get '/professor/new', to: "users#new_professor"
  post 'professors', to: "users#create_professor"
  post '/unlike', to: "likes#unlike", as: "unlike"
  post '/unfriend', to: "friends#unfriend", as: "unfriend"
end

