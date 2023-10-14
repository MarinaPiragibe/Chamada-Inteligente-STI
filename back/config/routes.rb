Rails.application.routes.draw do
  root 'alunos#index'
  resources :disciplinas
  resources :professors
  get "/turmas/:id", to: "turmas#home"
  get "/alunos", to: "alunos#index"
  post "/login", to: "alunos#login"

  resources :alunos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
